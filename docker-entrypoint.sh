#!/bin/bash

if [ -z "$ADMIN_PASSWORD" ]; then
    ADMIN_PASSWORD=cupsadmin
fi

if [ -z "$MAX_JOBS" ]; then
    MAX_JOBS=1
fi

# set max jobs
cp /etc/cups/cupsd.conf.default /etc/cups/cupsd.conf
sed -i "s/ErrorPolicy stop-printer/ErrorPolicy abort-job\nMaxJobs $MAX_JOBS/" /etc/cups/cupsd.conf
# allow remote administration
sed -i 's/Listen localhost:631/Listen *:631\nServerAlias */' /etc/cups/cupsd.conf
sed -i 's/Order allow,deny/Allow All\n  Order allow,deny/' /etc/cups/cupsd.conf

printf "${ADMIN_PASSWORD:-cupsadmin}\n${ADMIN_PASSWORD:-cupsadmin}" | passwd admin

cupsd -f
