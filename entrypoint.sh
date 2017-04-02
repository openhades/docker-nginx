#!/bin/bash

nginx_params=""

# configure custom user and group
if [ "${CUSTOM_UID}" ]; then
    if [ "${CUSTOM_GID}" ]; then
        _GROUP=""
        groupadd -g "${CUSTOM_GID}" ohc
        useradd -r -u "${CUSTOM_UID}" -g "${CUSTOM_GID}" -d /var/www/html -s /bin/nologin ohc
    else
        useradd -r -u "${CUSTOM_UID}" -d /var/www/html -s /bin/nologin ohc
    fi
    nginx_params="${nginx_params}user ohc ${_GROUP}; "
fi

exec nginx -g "daemon off; ${nginx_params}"
