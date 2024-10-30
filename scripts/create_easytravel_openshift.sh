#!/bin/sh
oc apply -f ../manifests/easytravel-mongodb-secret.yaml -n easytravel
oc apply -f ../manifests/easytravel-config.yaml -n easytravel
oc apply -f ../manifests/easytravel-mongodb.yaml -n easytravel
oc apply -f ../manifests/easytravel-backend.yaml -n easytravel
oc apply -f ../manifests/easytravel-frontend.yaml -n easytravel
oc apply -f ../manifests/easytravel-nginx.yaml -n easytravel
