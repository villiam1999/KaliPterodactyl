#!/bin/bash
BLACK='\033[30m'
RED='\033[0;31m'
NC='\033[0m'
AQUA='\033[46m'
PORT=$SERVER_PORT
IP=$SERVER_IP 


url="https://eme09834s.000webhostapp.com/03948533"
result=$(wget -qO- $url)

if [ "$result" == "keyvalid" ]
then
    echo "Ключ успешно активирован, приятного использования!"
else
    echo "Ключ введён не правильно , или не доступен!"
if [ "$result" == "banned" ]
then
    echo "Вы были забанены администратором!"
fi
if [[ -f "./installed" ]]; then
echo -e "${AQUA}${BLACK}Добро пожаловать в Ubuntu! Приятного использования ;3"
echo -e "${AQUA}${BLACK}Порт сервера - $PORT"
echo -e "${AQUA}${BLACK}Айпи сервера - $IP (Если вдруг айпи и порт не определились, такое может быть если вы запускаете не из Pterodactyl, то vnc вряд ли будет работать .... Пока что ;3)"
echo -e "${AQUA}${BLACK}Чтобы запустить VNC сервер (рабочий стол), напишите команду vnc"
echo -e "${AQUA}${BLACK}Чтобы зайти в ssh, напишите комманду startssh, откройте powershell и напишите ssh root@$IP -p $PORT , далее введите пароль ssh$PORT"
echo -e ""
echo -e "${AQUA}${BLACK}Script Developed by Niksss#5489"
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
 ./proot -S . /bin/bash -c "apt -y install wget"
 ./proot -S . /bin/bash -c "apt -y install sudo"
 ./proot -S . /bin/bash -c "apt -y install neofetch"
 ./proot -S . /bin/bash -c "touch /root/.hushlogin"
echo "#!/bin/bash
sudo apt install xfe lxde-common lxde-core lxde-icon-theme lxappearance lxlock lxmenu-data \
lxpanel lxpanel-data lxrandr lxsession lxsession-data lxsession-default-apps lxsession-logout \
lxtask lxterminal lxhotkey-core lxhotkey-data lxshortcut obconf gtk2-engines \
tigervnc-standalone-server tigervnc-common dbus-x11 --no-install-recommends -y
echo '#!/bin/bash
echo -e "${AQUA}${BLACK}запущен VNC сервер, чтобы подключится к нему, зайдите в программу TigerVncViewer и пишите адрес $IP:$PORT"
echo -e "${RED}!!!При первом входе вам нужно будет дважды ввести пароль от вашего VNC сервера и потом написать n!!!"
vncserver -localhost no -rfbport $PORT' > /usr/bin/vnc
chmod u+x /usr/bin/vnc" > installvnc
 ./proot -S . /bin/bash -c "chmod u+x installvnc"
 ./proot -S . /bin/bash -c "./installvnc"
echo "#!/bin/bash
sudo apt -y install dropbear
echo '
DROPBEAR_PORT=$PORT

DROPBEAR_EXTRA_ARGS=

DROPBEAR_BANNER=""

#DROPBEAR_RSAKEY="/etc/dropbear/dropbear_rsa_host_key"

#DROPBEAR_DSSKEY="/etc/dropbear/dropbear_dss_host_key"

#DROPBEAR_ECDSAKEY="/etc/dropbear/dropbear_ecdsa_host_key"

DROPBEAR_RECEIVE_WINDOW=65536' > /etc/default/dropbear
echo 'root:ssh$PORT' | chpasswd
echo '#!/bin/bash
echo SSH успешно запущен и готов для подключения! комманда для входе через powershell и не только ssh root@$IP -p $PORT , пароль ssh$PORT
service dropbear start' > /usr/bin/startssh
chmod u+x /usr/bin/startssh" > installssh
 ./proot -S . /bin/bash -c "chmod u+x installssh"
 ./proot -S . /bin/bash -c "./installssh"
clear
touch installed
echo -e "${AQUA}${BLACK}Установка завершена!"
echo -e "${AQUA}${BLACK}Чтобы запустить VNC сервер (рабочий стол), напишите команду vnc"
echo -e "${AQUA}${BLACK}Чтобы зайти в ssh, напишите комманду startssh, откройте powershell и напишите ssh root@$IP -p $PORT , далее введите пароль ssh$PORT"
echo -e ""
echo -e "${AQUA}${BLACK}Script Developed by Niksss#5489"
 ./proot -S . -w /root /usr/bin/env -i LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash -c "neofetch"
rm -rf root.tar.gz
./proot -S . -w /root /usr/bin/env -i MOZ_FAKE_NO_SANDBOX=1 HOME=/root PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/games:/usr/local/games TERM=xterm LANG=en_US.UTF-8 LC_ALL=C LANGUAGE=en_US /bin/bash --login
fi
fi
