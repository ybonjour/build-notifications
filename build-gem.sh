#!/bin/bash

set -e

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


docker run --rm -v $(pwd):/workspace build-notifications bash -c "(cd /workspace; gem build build-notifications.gemspec)"