#!/bin/bash
BLACK='\033[30m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'

if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Kali Linux! Приятного использования ;3"
cd kali-amd64
./proot -S . /bin/bash --login
else
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.xz https://kali.download/nethunter-images/current/rootfs/kalifs-amd64-minimal.tar.xz
echo "Скачивание необходимых компонентов... (50%)"
curl -sSLo xz https://github.com/villiam1999/KaliPterodactyl/raw/main/xz
chmod u+x xz
echo "Установка системы... (60%)"
tar -I ./xz -xf ./root.tar.xz
echo "Скачивание необходимых компонентов... (80%)"
cd kali-amd64
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
chmod u+x proot
 ./proot -S . /bin/bash -c "apt update"
 ./proot -S . /bin/bash -c "apt -y install neofetch"
 ./proot -S . /bin/bash -c "apt-get -y install curl"
clear
echo -e "${AQUA}${BLACK}Установка завершена!"
 ./proot -S . /bin/bash -c "neofetch"
cd ..
touch installed
cd kali-amd64
./proot -S . /bin/bash --login
fi
