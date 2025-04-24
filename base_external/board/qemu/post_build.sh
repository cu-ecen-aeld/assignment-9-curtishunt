#!/bin/sh
# post-build.sh

TARGET_DIR=$1
mkdir -p ${TARGET_DIR}/root/.ssh
cp board/ssh/id_rsa_aeld.pub ${TARGET_DIR}/root/.ssh/authorized_keys
chmod 700 ${TARGET_DIR}/root/.ssh
chmod 600 ${TARGET_DIR}/root/.ssh/authorized_keys
