#!/bin/bash
echo "Установка необходимых файлов (0%)"
curl -sSLo runimage https://github.com/VHSgunzo/runimage/releases/download/v0.38.4/runimage
chmod +x runimage*
echo "Распаковка системы (10%)"
./runimage --runtime-extract
echo "Установка системы (50%)"
cd $HOME/RunDir
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
echo "Запуск системы (100%)"
chmod +x proot
./proot -S rootfs bash
