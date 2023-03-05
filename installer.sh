#!/bin/bash
if [[ -f "./installed" ]]; then
echo "Добро пожаловать в Parrot! Приятного использования ;3"
./proot -S . /bin/bash --login
else
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.xz https://github.com/RiSecID/AndronixOrigin/blob/master/Rootfs/Parrot/amd64/parrot-rootfs-amd64.tar.xz?raw=true
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
echo "Установка завершена!"
touch installed
./proot -S . /bin/bash --login
