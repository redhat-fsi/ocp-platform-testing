#!/bin/bash

set -e

FEATURES="cd /tests; bundle exec cucumber $@ --format junit --out /out"

echo "Running container with args $@"

podman run \
	--rm \
	-v .:/out:Z \
	-e BUSHSLICER_DEBUG_AFTER_FAIL=0 \
	-e BUSHSLICER_DEFAULT_ENVIRONMENT=ocp4 \
	-e OPENSHIFT_ENV_OCP4_HOSTS=<cluster api endpoint fqdn>:lb \
	-e OPENSHIFT_ENV_OCP4_ADMIN_CREDS_SPEC=file:///root/.kube/config \
	-e BUSHSLICER_CONFIG='{"global": {"browser": "firefox"}}' \
	-e OPENSHIFT_ENV_OCP4_USER_MANAGER_USERS=<openshift user>:<openshift user password> \
	-e OCP_ADMIN_USER=<admin username> \
	-e OCP_ADMIN_PASS=<admin password> \
	-e OCP_API_URL=https://<cluster api endpoint fqdn>:6443 \
	oc-test "$FEATURES"

echo "Done"

