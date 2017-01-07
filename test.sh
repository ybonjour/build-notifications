#!/bin/bash

set -e

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

# Mount workspace directly so the image does not always have to be rebuilt to run tests
docker run --rm -v $dir:/workspace build-notifications bash -c "(cd workspace; rspec spec --color --format=documentation)"