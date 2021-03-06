#!/bin/bash

HASTE_DATA_DIR=/var/www/synbin/haste-server/data
EXPIRES=43200
CURRENT=$(date +%s)
echo ""
echo "Beginning sweep..."
for file in $(sudo find ${HASTE_DATA_DIR} -type f); do
    short=$(basename ${file})
    created=$(sudo stat -c %Y ${file})
    diff=$(expr ${CURRENT} - ${created})
    echo "    ${short}: ${diff}"
    if (( diff > EXPIRES )); then
        echo "        Removing expired file: ${short}"
        sudo rm ${file}
    fi
done
echo "Last sweep: ${CURRENT}"
echo ""

