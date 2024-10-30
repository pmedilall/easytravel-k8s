#!/bin/sh

oc apply -f ../manifests/easytravel-config.yaml
oc apply -f ../manifests/easytravel-loadgen.yaml
