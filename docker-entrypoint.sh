#!/bin/bash

# Make ppd and ssl directories if needed
# cups can't make server credentials if ssl directory is missing
mkdir -p /config/ppd /config/ssl

if [ ! -f /config/cupsd.conf ]; then
    # copy default cups files
    cp -R /etc/cups/* /config
    # set max jobs
    cp /config/cupsd.conf.default /config/cupsd.conf
    sed -i "s/ErrorPolicy stop-printer/ErrorPolicy abort-job\nMaxJobs 10/" /config/cupsd.conf
    # allow remote administration
    sed -i 's/Listen localhost:631/Listen *:631\nServerAlias */' /config/cupsd.conf
    sed -i 's/Order allow,deny/Allow All\n  Order allow,deny/' /config/cupsd.conf
fi

printf "${ADMIN_PASSWORD:-cupsadmin}\n${ADMIN_PASSWORD:-cupsadmin}" | passwd admin &> /dev/null

echo "Starting cupsd..."
cupsd -f -c /config/cupsd.conf
