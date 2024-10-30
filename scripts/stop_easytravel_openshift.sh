#!/bin/sh

oc -n easytravel scale deploy --replicas=0 deployment/easytravel-www
oc -n easytravel scale deploy --replicas=0 deployment/easytravel-frontend
oc -n easytravel scale deploy --replicas=0 deployment/easytravel-backend
oc -n easytravel scale deploy --replicas=0 deployment/easytravel-mongodb


