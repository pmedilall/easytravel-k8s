#!/bin/sh

oc -n easytravel scale deploy --replicas=1 deployment/easytravel-mongodb
oc -n easytravel scale deploy --replicas=1 deployment/easytravel-backend
oc -n easytravel scale deploy --replicas=1 deployment/easytravel-frontend
oc -n easytravel scale deploy --replicas=1 deployment/easytravel-www
