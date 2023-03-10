#!/bin/bash
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
su" >> $HOME/lolya
