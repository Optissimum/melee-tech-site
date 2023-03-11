# Build
FROM golang:alpine AS build

ENV CGO_ENABLED=0

RUN apk add --no-cache -U build-base git make

RUN mkdir -p /src

WORKDIR /src

# Copy Makefile
COPY Makefile ./

# Install deps
RUN make deps

# Copy content
COPY . .

# Build the site
RUN make build

# Runtime
FROM alpine AS runtime

RUN apk --no-cache -U add su-exec shadow

ENV PUID=10000
ENV PGID=10000

RUN addgroup -g "${PGID}" zs && \
    adduser -D -H -G zs -h /var/empty -u "${PUID}" zs && \
    mkdir -p /data && chown -R zs:zs /data

EXPOSE 8000

VOLUME /data

WORKDIR /

COPY --from=build /go/bin/static /usr/local/bin/static
COPY --from=build /src/.pub /data

COPY .dockerfiles/entrypoint.sh /init

ENTRYPOINT ["/init"]

CMD ["static", "-n", "-s", "-r", "/data"]
