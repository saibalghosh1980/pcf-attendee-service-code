#!/bin/bash

set -xe

pwd
env

cf api $PWS_API --skip-ssl-validation

cf login -u $PWS_USER -p $PWS_PWD -o "$PWS_ORG" -s "$PWS_SPACE"

cf apps

cf routes

echo "--------------------------------------------------------------------------"
echo "DELETE OLD APP"
cf delete -f attendee
cf rename attendee-green attendee
cf restart attendee
cf delete-route -f  apps.cumuluslabs.io -n attendee-cutcha-godson-green
cf routes
echo "GREEN TURNED TO BLUE"
echo "--------------------------------------------------------------------------"

