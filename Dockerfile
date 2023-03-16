# Build
FROM golang:alpine AS build

RUN apk add --no-cache -U build-base git

RUN mkdir -p /src

WORKDIR /src

# Copy Makefile
COPY Makefile ./

# Install deps
RUN make deps

# Copy content
COPY . .

# Build the site
RUN zs build

# Runtime
FROM prologic/static AS runtime

COPY --from=build /src/.pub /data
