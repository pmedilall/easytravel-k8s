# Easy Travel Setup

## K8s cluster

## Install Dynatrace Operator

## Install EasyTravel
```
./scripts/create_easytravel.sh
./scripts/start_loadgen
```
### Red Hat OpenShift instructions

To deploy Easytravel in OpenShift you need to have:

- Dynatrace operator installed on the cluster
  - here's a [guide](https://docs.dynatrace.com/docs/setup-and-configuration/setup-on-k8s/installation/other/ocp-operator-hub) on how to install it

- `oc` tool installed
  - go to the main help icon on your OpenShift console (top right corner indicated by a ?) and select "Command Line Tools" to see how you install the `oc` tool 

```bash
# Login in to your OpenShift cluster and enter the password when prompted. . Replace <cluster admin user> with your admin user name.
oc login <OpenSHift API URL> -u <cluster admin user>

# first create the project
oc new-project easytravel

# Add policies for deploying the EasyTrade resources. Replace <cluster admin user> with your admin user name.
oc adm policy add-role-to-user admin <cluster admin user> -n easytravel
oc adm policy add-scc-to-user anyuid -z default -n easytravel 

# then use the manifests to deploy the EasyTrade resources
# wait until all the pods for the app are up and running
oc -n easytravel apply -f ./manifests

# to access the frontend EasyTrade UI
# create a route in OpenShift for the frontendreverseproxy-easytrade service
oc expose svc/frontendreverseproxy-easytrade --name=easytrade-frontend -n easytrade
oc get route/easytrade-frontend

# to delete the deployment
oc delete easytravel
```


# Monitoring Automation
Monitoring settings are automated through the use of [Dynatrace Monaco](https://github.com/dynatrace-oss/dynatrace-monitoring-as-code_). Here is a link to the official [Documenation](https://dynatrace-oss.github.io/dynatrace-monitoring-as-code/)

## Running Monaco
### Set Env variables:
Powershell
```
$ENV:NEW_CLI = 1
$ENV:DYNATRACE_URL = 'https://[ID].live.dynatrace.com'
$ENV:DYNATRACE_TOKEN = 'dtco1.****'
$ENV:EASYTRAVEL_EMAIL_CONTACTS = '"test@example.com", "hello@world.com"'
```

Bash
```
export NEW_CLI = 1
export DYNATRACE_URL = 'https://[ID].live.dynatrace.com'
export DYNATRACE_TOKEN = 'dtco1.****'
export EASYTRAVEL_EMAIL_CONTACTS = '"test@example.com", "hello@world.com"'
```

### Run Monaco
Specific Project e.g. easyTravel
```
monaco deploy -e environments.yaml -s dynatrace_tenant -p projects/PROJECT --dry-run
monaco deploy -e environments.yaml -s dynatrace_tenant -p projects/PROJECT
```

ALL projects
```
monaco deploy -e environments.yaml -s dynatrace_tenant -p projects --dry-run
monaco deploy -e environments.yaml -s dynatrace_tenant -p projects
```

### Delete config
Copy required delete config sections from `delete_backup.yaml` to a file called `delete.yaml`. Then run monaco

## Settings Created in Dynatrace
Using the Dynatrace Monitoring as code utility to create resources:
### Dashboards
### Management Zones
* General
    * Team: Infrastructure - All Hosts, k8s cluster
    * Team: Business - All Applications, synthetics
    * Environment: Prod - All production entities
* Applications
    * Application: Easytravel - easyTravel Dynatrace entitiesHosts
### Tagging rules
* K8s Annotations
    * contact
    * priority
    * tier
    * application
### Application Rules

### Alerting Profile

### Problem notifications

### Service Level Objectives - SLO
