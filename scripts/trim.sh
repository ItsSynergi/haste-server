#!/bin/bash

HASTE_LOG_DIR=/var/log/haste-clean.log
KEEP_NUM_LINES=1000

echo "$(tail -n $KEEP_NUM_LINES $HASTE_LOG_DIR)" > $HASTE_LOG_DIR

