#!/bin/bash

# configure custom user and group
if [ "${CUSTOM_UID}" ]; then
    _GROUP=""
    if [ "${CUSTOM_GID}" ]; then
        _GROUP=" ohc"
        groupadd -g "${CUSTOM_GID}" ohc
        useradd -r -u "${CUSTOM_UID}" -g "${CUSTOM_GID}" -d /var/www/html -s /bin/nologin ohc
    else
        useradd -r -u "${CUSTOM_UID}" -d /var/www/html -s /bin/nologin ohc
    fi
    sed -i "s/user .*;/user ohc${_GROUP};/" /etc/nginx/nginx.conf
fi

exec nginx -g "daemon off;"
