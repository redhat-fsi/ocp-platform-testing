#!/bin/bash

set -e

echo "removing oc-test"

podman image rm oc-test

echo "done"

