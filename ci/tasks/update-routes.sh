#!/bin/bash

set -xe

pwd
env

cf api $PWS_API --skip-ssl-validation

cf login -u $PWS_USER -p $PWS_PWD -o "$PWS_ORG" -s "$PWS_SPACE"

cf apps

cf routes

cf map-route $NEXT_APP_HOSTNAME $PWS_DOMAIN_NAME --hostname $MAIN_ROUTE_HOSTNAME

echo "--------------------------------------------------------------------------"
echo "CHANGING ROUTE"
cf unmap-route attendee-green apps.cumuluslabs.io -n attendee-cutcha-godson
cf routes
echo "Routes updated"
echo "--------------------------------------------------------------------------"
