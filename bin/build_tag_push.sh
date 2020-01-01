#!/bin/bash

set -exuo pipefail

TAG=${1:-latest}

docker build -t sskoopa/rust:${TAG} .
docker login
docker push sskoopa/rust:${TAG}
