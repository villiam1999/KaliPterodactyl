#!/bin/bash
# termdo start
BASE_DIR="/home/container"
INSTALL_DIR="${BASE_DIR}/termdo_alpine"
PROOT="proot"

curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/releases/download/PteroFile/proot
curl -sSLo root.tar.gz https://github.com/villiam1999/KaliPterodactyl/releases/download/PteroFile/root.tar.gz
mkdir ${INSTALL_DIR}
tar -xzf ${BASE_DIR}/root* -C ${INSTALL_DIR}
rm -rf ${BASE_DIR}/root*

# setup proc
curl -sSLo start.sh https://raw.githubusercontent.com/villiam1999/KaliPterodactyl/main/start.sh
mv ${BASE_DIR}/proc ${INSTALL_DIR} -f
chmod 777 ${INSTALL_DIR}/proc

rm -rf ${BASE_DIR}/proc
rm -rf ${BASE_DIR}/install.sh
rm -rf ${BASE_DIR}/termdo_alpine.zip

chmod 777 ${BASE_DIR}/${PROOT}
chmod +x ${BASE_DIR}/start.sh
cd ${BASE_DIR}
./start.sh
