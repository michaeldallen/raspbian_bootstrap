mymac=$(ifconfig eth0 | sed --regexp-extended --silent 's/.*ether (([0-9a-f]{2}:){5}[0-9a-f]{2}).*/\1/p')
iam=$(basename $0 .bash)

if [ -f io.mdabone.device.config.hostname.${mymac} ] ; then
    cmd="/usr/bin/raspi-config nonint do_hostname $(cat io.mdabone.device.config.hostname.${mymac})"
    echo "(about to) ${cmd}"
    eval ${cmd}
fi
