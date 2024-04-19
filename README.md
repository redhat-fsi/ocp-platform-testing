# OpenShift Verification Tests

Based off of [this repo](https://github.com/openshift/verification-tests/tree/master). Containerized and running via ubi8.

# Instructions

1. Run `build-container.sh`
2. Run `run-container.sh`.
  * Args can be passed like `run-container.sh features/cli/create.feature`
  * No args will run all tests

# Cleanup

Run `remove-image.sh`.

# Manual Usage

The `run-container.sh` script will automatically run cucumber tests.
If running tests manually inside of the container or additional configuration
is needed, then the container can be started manually.

Copy the `podman run ...` command from `run-container.sh` and run it without
passing any args. The environment variables can be omitted as well, if desired.
Inside the container, the tests are located at `/tests`.

The following snippet may be used for executing tests:

```bash
#!/bin/bash

export BUSHSLICER_DEBUG_AFTER_FAIL=0
export BUSHSLICER_DEFAULT_ENVIRONMENT=ocp4
# Change this to the actual cluster's api endpoint
export OPENSHIFT_ENV_OCP4_HOSTS=api.cluster-7d9lx.dynamic.redhatworkshops.io:6443:lb
# This should be mounted/copied into the container
export OPENSHIFT_ENV_OCP4_ADMIN_CREDS_SPEC=file:///work/kubeconfig
export BUSHSLICER_CONFIG='{"global": {"browser": "firefox"}}'
# This should be a real user on the cluster
export OPENSHIFT_ENV_OCP4_USER_MANAGER_USERS=user1:pVTcNrAJdWSSzPCy

# Add "$@" if you want to pass arguments instead of hard coding them
bundle exec cucumber
```
