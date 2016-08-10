#!/usr/bin/env bash

set -e -u -x

# yes | docker-machine regenerate-certs concourse-gerrit-docker
eval "$(docker-machine env concourse-gerrit-docker)"
docker exec -u 0 -it concoursedocker_gerrit_1 /var/gerrit/etc/setup.sh

exit 0
