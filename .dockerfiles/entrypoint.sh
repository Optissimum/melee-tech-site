#!/bin/sh

[ -n "${PUID}" ] && usermod -u "${PUID}" mpp
[ -n "${PGID}" ] && groupmod -g "${PGID}" mpp

printf "Configuring mpp...\n"
npx react-inject-env set -d /data

printf "Switching UID=%s and GID=%s\n" "${PUID}" "${PGID}"
exec su-exec mpp:mpp "$@"
