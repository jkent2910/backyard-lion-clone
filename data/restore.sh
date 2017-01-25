#!/bin/sh

if [ $# != 1 ]
then
    echo Usage: restore.sh database.dump >&2
    exit 1
fi

if [ -f $1 ]
then
    echo "Restoring $1"
    pg_restore --verbose --clean --no-acl --no-owner -d backyard-lion_production $1
else
    echo "$1 not found"
fi
