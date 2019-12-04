apt-get install --assume-yes ruby ruby-dev build-essential


gem install sensu


[ -d /etc/sensu/conf.d ] || mkdir -pv /etc/sensu/conf.d

mymac=$(ifconfig eth0 | sed --regexp-extended --silent 's/.*ether (([0-9a-f]{2}:){5}[0-9a-f]{2}).*/\1/p')

if [ -f io.mdabone.device.config.hostname.${mymac} ] ; then
    hostname="$(cat io.mdabone.device.config.hostname.${mymac})"
    echo using hostname: ${hostname}
else
    echo no definitive hostname
    exit 1
fi


cat << EOF | sed "s/%HOSTNAME%/${hostname}/" > /etc/sensu/conf.d/client.json
{
   "client": {
       "name": "%HOSTNAME%",
       "address": "localhost",
       "subscriptions": [
           "test"
       ]
   }
}
EOF


cat << EOF | sed "s/%HOSTNAME%/${hostname}/" > /etc/sensu/conf.d/rabbitmq.json
{
   "rabbitmq": {
       "host": "mallen-deb9-64.dhcp.mathworks.com",
       "vhost": "/sensu",
       "user": "sensu",
       "password": "secret"
   }
}
EOF


useradd sensu


chown -Rv sensu. /etc/sensu/


cat << EOF | sed "s/%HOSTNAME%/${hostname}/" > /etc/systemd/system/sensu-client.service
[Unit]
Description=sensu client

[Service]
User=sensu
Group=sensu
ExecStart=/usr/local/bin/sensu-client
KillMode=process
Restart=on-failure
RestartSec=1min

[Install]
WantedBy=multi-user.target

EOF


systemctl --no-pager enable sensu-client


systemctl --no-pager start sensu-client


systemctl --no-pager status sensu-client


