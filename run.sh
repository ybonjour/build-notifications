#!/bin/bash

set -e

dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)


docker run --rm -p 80:80 build-notifications build-notifications