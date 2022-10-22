#!/bin/bash
set -e

source functions.sh

URI=${KEYCLOAK_URI}
if [ "" == "${URI}" ]; then
    URI="http://${KEYCLOAK_HOST:-keycloak}:8080"
fi

wait_for_url $URI "Waiting for Keycloak to start"

start-kafka.sh