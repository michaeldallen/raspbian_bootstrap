mymac=$(ifconfig eth0 | sed --regexp-extended --silent 's/.*ether (([0-9a-f]{2}:){5}[0-9a-f]{2}).*/\1/p')
echo "I think my MAC address is '${mymac}'"

if [ -f io.mdabone.device.config.hostname.${mymac} ] ; then
    hostname="$(cat io.mdabone.device.config.hostname.${mymac})"
fi
echo "I think I am '${hostname}'"

