#!/bin/bash
BLACK='\033[30m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'

if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Ubuntu! Приятного использования ;3"
    function runcmd {
        printf "UbuntuVPS:~ "
        read -r cmdtorun
        ./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login 
        runcmd
    }
    runcmd
else
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.gz https://github.com/AndronixApp/AndronixOrigin/raw/master/Rootfs/Ubuntu20/focal-amd64.tar.gz
echo "Скачивание необходимых компонентов... (50%)"
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
chmod u+x proot
echo "Установка системы... (0%)"
tar -xf root.tar.gz
echo "Установка системы... (30%)"
 ./proot -S . /bin/bash -c "apt-get update"
 ./proot -S . /bin/bash -c "apt update"
 ./proot -S . /bin/bash -c "apt -y install curl"
 ./proot -S . /bin/bash -c "apt -y install sudo"
 ./proot -S . /bin/bash -c "apt -y install neofetch"
 ./proot -S . HOME=/root /bin/bash -c "touch ~/.hushlogin"
clear
touch installed
echo -e "${AQUA}${BLACK}Установка завершена!"
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
fi
