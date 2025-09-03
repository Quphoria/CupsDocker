#!/bin/bash

printf "${ADMIN_PASSWORD:-cupsadmin}\n${ADMIN_PASSWORD:-cupsadmin}" | passwd admin &> /dev/null

echo "Starting cupsd..."
cupsd -f
