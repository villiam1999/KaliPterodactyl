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
apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install xfce4 xfce4-goodies xorg lxde-core tigervnc-standalone-server tigervnc-xorg-extension -y --allow-unauthenticated
vncserver
vncserver -kill :1
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
echo "#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
lxterminal &
/usr/bin/lxsession -s LXDE &" >> ~/.vnc/xstartup
sudo chmod +x ~/.vnc/xstartup
echo "#!/bin/bash
PATH="$PATH:/usr/bin/"
export USER="user"
DISPLAY="1"
DEPTH="16"
GEOMETRY="1024x768"
OPTIONS="-depth ${DEPTH} -geometry ${GEOMETRY} :${DISPLAY} -localhost"
. /lib/lsb/init-functions" >> /etc/init.d/vncserver
sudo chmod +x /etc/init.d/vncserver
vncserver
su' > installvnc
 ./proot -S . /bin/bash -c "chmod u+x installvnc"
clear
touch installed
echo -e "${AQUA}${BLACK}Установка завершена!"
 ./proot -S . -w /root /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "neofetch"
rm -rf root.tar.gz
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
fi
