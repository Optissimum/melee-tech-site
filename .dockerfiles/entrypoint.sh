#!/bin/sh

[ -n "${PUID}" ] && usermod -u "${PUID}" zs
[ -n "${PGID}" ] && groupmod -g "${PGID}" zs

printf "Configuring zs...\n"

printf "Switching UID=%s and GID=%s\n" "${PUID}" "${PGID}"
exec su-exec zs:zs "$@"
