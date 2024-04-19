#!/bin/bash

source ~/.bash_profile

oc login --insecure-skip-tls-verify=true -u "$OCP_ADMIN_USER" -p "$OCP_ADMIN_PASS" "$OCP_API_URL"

bash -c "$@"

