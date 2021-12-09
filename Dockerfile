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
FROM scratch

WORKDIR /
VOLUME /data

COPY --from=build /go/bin/static /static
COPY --from=build /src/.pub /data

ENTRYPOINT ["/static"]
CMD ["-r", "/data"]
