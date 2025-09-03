#!/bin/bash

if [ ! -f /config/cupsd.conf ]; then
    # set max jobs
    cp /etc/cups/cupsd.conf.default /config/cupsd.conf
    sed -i "s/ErrorPolicy stop-printer/ErrorPolicy abort-job\nMaxJobs 10/" /config/cupsd.conf
    # allow remote administration
    sed -i 's/Listen localhost:631/Listen *:631\nServerAlias */' /config/cupsd.conf
    sed -i 's/Order allow,deny/Allow All\n  Order allow,deny/' /config/cupsd.conf
fi

printf "${ADMIN_PASSWORD:-cupsadmin}\n${ADMIN_PASSWORD:-cupsadmin}" | passwd admin &> /dev/null

echo "Starting cupsd..."
cupsd -f -c /config/cupsd.conf
