#!/usr/bin/env bash

set -e -u -x

export HOST_IP=192.168.99.101

mkdir -p ~/.ssh
cp /var/gerrit/etc/keys/gerrit_key ~/.ssh/id_rsa
cp /var/gerrit/etc/keys/gerrit_key.pub ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa.pub

cp /var/gerrit/etc/keys/malston_key ~/.ssh/malston_key
cp /var/gerrit/etc/keys/malston_key.pub ~/.ssh/malston_key.pub
chmod 600 ~/.ssh/malston_key
chmod 600 ~/.ssh/malston_key.pub

################################################################################
# Pause here and manually add gerrit_key.pub to Administrator account
################################################################################

# ssh-add ~/.ssh/id_rsa >/dev/null

cat ~/.ssh/malston_key.pub | ssh -p 29418 admin@localhost gerrit create-account \
  --full-name 'Mark malston' --email 'malston@pivotal.io' --http-password 'password' --group "'Administrators'" --ssh-key - malston

cd
git config --global user.email "malston@pivotal.io"
git config --global user.name "Mark Alston"
ssh -p 29418 admin@localhost gerrit create-project demo-project --empty-commit
git clone ssh://admin@localhost:29418/demo-project
cd demo-project/
gitdir=$(git rev-parse --git-dir); scp -p -P 29418 admin@localhost:hooks/commit-msg ${gitdir}/hooks/
date > testfile.txt
git add testfile.txt
git commit -m "My pretty test commit"
git push origin HEAD:refs/for/master

cd
ssh -p 29418 admin@localhost gerrit create-project malston/concourse-ci-demo
ssh -p 29418 admin@localhost gerrit create-account --full-name 'Dan dnemeth' --email 'dnemeth@pivotal.io' --http-password 'password'

git clone https://github.com/malston/concourse-ci-demo.git
cd concourse-ci-demo
gitdir=$(git rev-parse --git-dir); scp -p -P 29418 malston@localhost:hooks/commit-msg ${gitdir}/hooks/

git push ssh://malston@localhost:29418/malston/concourse-ci-demo *:*
