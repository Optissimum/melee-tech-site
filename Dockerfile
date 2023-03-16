# Build
FROM prologic/zs AS build

RUN mkdir -p /src

WORKDIR /src

# Copy content
COPY . .

# Build the site
RUN zs build

# Runtime
FROM prologic/static AS runtime

COPY --from=build /src/.pub /data
