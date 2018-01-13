#!/bin/bash

set -xe

pwd
env

cf api $PWS_API --skip-ssl-validation

cf login -u $PWS_USER -p $PWS_PWD -o "$PWS_ORG" -s "$PWS_SPACE"

cf apps

cf routes



echo "--------------------------------------------------------------------------"
echo "CHANGING ROUTE"
cf map-route attendee-green apps.cumuluslabs.io --hostname attendee-cutcha-godson
cf routes
echo "Routes updated"
echo "--------------------------------------------------------------------------"

