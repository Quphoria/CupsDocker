#!/bin/bash

chown root:lp /etc/cups/cupsd.conf
chown root:lp /etc/cups/printers.conf

printf "${ADMIN_PASSWORD:-cupsadmin}\n${ADMIN_PASSWORD:-cupsadmin}" | passwd admin &> /dev/null

echo "Starting cupsd..."
cupsd -f
