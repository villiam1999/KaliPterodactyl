#!/bin/bash
BLACK='\033[30m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'

if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Kali Linux! Приятного использования ;3"
./proot -S . /bin/bash --login
else
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.xz https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Rootfs/Kali/amd64/kali-rootfs-amd64.tar.xz
echo "Скачивание необходимых компонентов... (20%)"
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
chmod u+x proot
echo "Скачивание необходимых компонентов... (50%)"
curl -sSLo xz https://github.com/villiam1999/KaliPterodactyl/raw/main/xz
chmod u+x xz
echo "Установка системы... (100%)"
tar -I ./xz -xf ./root.tar.xz
cd $HOME/etc/
wget https://raw.githubusercontent.com/villiam1999/KaliPterodactyl/main/locale.gen
cd $HOME
 ./proot -S . /bin/bash -c "apt-get update"
 ./proot -S . /bin/bash -c "apt update"
 ./proot -S . /bin/bash -c "apt-get -y install curl"
 ./proot -S . /bin/bash -c "apt-get -y install sudo"
 ./proot -S . /bin/bash -c "apt -y install locales"
 ./proot -S . /bin/bash -c "locale-gen"
 ./proot -S . /bin/bash -c "apt-get -y install neofetch"
clear
echo -e "${AQUA}${BLACK}Установка завершена!"
 ./proot -S . /bin/bash -c "neofetch"
touch installed
./proot -S . /bin/bash --login
fi
