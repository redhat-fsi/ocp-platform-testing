#!/bin/bash

set -e

echo "Building container"

podman build -f Containerfile -t oc-test .

echo "Done"

