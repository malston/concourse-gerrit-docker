#!/usr/bin/env bash

set -e -u -x

mkdir -p keys/web keys/worker

yes | ssh-keygen -t rsa -f ./keys/web/tsa_host_key -N ''
yes | ssh-keygen -t rsa -f ./keys/web/session_signing_key -N ''

yes | ssh-keygen -t rsa -f ./keys/worker/worker_key -N ''

cp ./keys/worker/worker_key.pub ./keys/web/authorized_worker_keys
cp ./keys/web/tsa_host_key.pub ./keys/worker

yes | ssh-keygen -t rsa -f ./keys/gerrit/gerrit_key -N ''
yes | ssh-keygen -t rsa -f ./keys/gerrit/malston_key -N ''

cp ./keys/gerrit/gerrit_key ./gerrit/etc/keys/gerrit_key
cp ./keys/gerrit/gerrit_key.pub ./gerrit/etc/keys/gerrit_key.pub
cp ./keys/gerrit/malston_key ./gerrit/etc/keys/malston_key
cp ./keys/gerrit/malston_key.pub ./gerrit/etc/keys/malston_key.pub
