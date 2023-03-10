#!/bin/bash
BLACK='\033[30m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'
PORT=$SERVER_PORT
IP=$SERVER_IP

if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Ubuntu! Приятного использования ;3"
echo -e "${AQUA}${BLACK}Порт сервера - $PORT"
echo -e "${AQUA}${BLACK}Айпи сервера - $IP"
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
else
echo "Скачивание системы... (0%)"
curl -sSLo root.tar.gz https://github.com/AndronixApp/AndronixOrigin/raw/master/Rootfs/Ubuntu20/focal-amd64.tar.gz
echo "Скачивание необходимых компонентов... (50%)"
curl -sSLo proot https://github.com/villiam1999/KaliPterodactyl/raw/main/proot
chmod u+x proot
echo "Установка системы... (0%)"
tar -xf root.tar.gz
echo "Установка системы... (100%)"
 ./proot -S . /bin/bash -c "apt-get update"
 ./proot -S . /bin/bash -c "apt update"
 ./proot -S . /bin/bash -c "apt -y install curl"
 ./proot -S . /bin/bash -c "apt -y install sudo"
 ./proot -S . /bin/bash -c "apt -y install neofetch"
 ./proot -S . /bin/bash -c "touch /root/.hushlogin"
echo '#!/bin/bash
sudo apt install xfe lxde-common lxde-core lxde-icon-theme lxappearance lxlock lxmenu-data \
lxpanel lxpanel-data lxrandr lxsession lxsession-data lxsession-default-apps lxsession-logout \
lxtask lxterminal lxhotkey-core lxhotkey-data lxshortcut obconf gtk2-engines \
tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y
echo '#!/bin/bash
echo "запущен VNC сервер, чтобы подключится к нему, зайдите в программу TigerVncViewer и пишите адрес $IP:$PORT"
vncserver -localhost no -rfbport $PORT' > /usr/bin/vnc' > installvnc
clear
touch installed
echo -e "${AQUA}${BLACK}Установка завершена!"
 ./proot -S . -w /root /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "neofetch"
rm -rf root.tar.gz
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
fi
