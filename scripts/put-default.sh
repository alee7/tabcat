#!/bin/sh

# Upload a CouchDB doc if it doesn't already exist

# Usage: ./put-default.sh filename URL [ mime-type ]
FILENAME=$1
URL=$2
MIME_TYPE=$3
if [ -z "$MIME_TYPE" ]; then MIME_TYPE=application-json; fi

curl -X HEAD $URL -f -I -s > /dev/null || \
curl -X PUT $URL -f -H "Content-Type: $MIME_TYPE" --data-binary "@$FILENAME"