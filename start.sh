#!/bin/bash
# termdo start
BASE_DIR="/home/container"
INSTALL_DIR="${BASE_DIR}/termdo_alpine"
PROOT="proot"

export PROOT_TMP_DIR=${INSTALL_DIR}/tmp
cd ${BASE_DIR}
./${PROOT} \
    --kernel-release=5.4.0-faked \
    --link2symlink \
    --kill-on-exit \
    --rootfs="${INSTALL_DIR}" \
    --root-id \
    --cwd=/root \
    --bind=/dev \
    --bind="/dev/urandom:/dev/random" \
    --bind=/proc \
    --bind="/proc/self/fd:/dev/fd" \
    --bind="/proc/self/fd/0:/dev/stdin" \
    --bind="/proc/self/fd/1:/dev/stdout" \
    --bind="/proc/self/fd/2:/dev/stderr" \
    --bind=/sys \
    --bind="${INSTALL_DIR}/root:/dev/shm" \
