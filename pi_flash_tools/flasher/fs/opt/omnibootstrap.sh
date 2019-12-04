dev=/dev/sdb
iam=mallen-pi-l

echo "${dev}" ; echo "${iam}"

echo "${dev}" ; umount ${dev}{1,2}

echo "${dev}" ; ./hyperiot-flash -d ${dev} 2019-07-10-raspbian-buster-lite.img
                
echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}1 /tmp/pimnt ; ls -l /tmp/pimnt ; touch /tmp/pimnt/ssh ; ls -l /tmp/pimnt ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}1 /tmp/pimnt ; ls -l /tmp/pimnt ; [ -f /tmp/pimnt/mpinet.host_device_map.v4 ] || cp -v mpinet.host_device_map.v4 /tmp/pimnt/mpinet.host_device_map.v4 ; ls -l /tmp/pimnt ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}1 /tmp/pimnt ; ls -l /tmp/pimnt ; [ -f /tmp/pimnt/mpinet.hostname.lkg ] || echo ${iam} > /tmp/pimnt/mpinet.hostname.lkg ; ls -l /tmp/pimnt ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt




echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}1 /tmp/pimnt ; ls -l /tmp/pimnt ; cp -vi mallen-wpa_supplicant.conf /tmp/pimnt/mallen-wpa_supplicant.conf ; ls -l /tmp/pimnt ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}1 /tmp/pimnt ; ls -l /tmp/pimnt ; cp -vi dhcpcd.conf /tmp/pimnt/dhcpcd.conf ; ls -l /tmp/pimnt ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt





echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; grep pi /tmp/pimnt/etc/shadow ; sed -i.bootstrap 's/^\(pi:\)[^:]*\(:.*\)/\1x\2/' /tmp/pimnt/etc/shadow ; grep pi /tmp/pimnt/etc/shadow ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; cat /tmp/pimnt/etc/hostname; echo "${iam}" >  /tmp/pimnt/etc/hostname; cat /tmp/pimnt/etc/hostname; umount /tmp/pimnt ; rmdir -v /tmp/pimnt



echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; cat /tmp/pimnt/etc/default/keyboard | sed 's/^/before:/' ; sed -i.bootstrap 's/XKBMODEL=.*/XKBMODEL="pc105"/' /tmp/pimnt/etc/default/keyboard ; cat /tmp/pimnt/etc/default/keyboard | sed 's/^/after:/' ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt


echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; cat /tmp/pimnt/etc/default/keyboard | sed 's/^/before:/' ; sed -i.bootstrap 's/XKBLAYOUT=.*/XKBLAYOUT="us"/' /tmp/pimnt/etc/default/keyboard ; cat /tmp/pimnt/etc/default/keyboard | sed 's/^/after:/' ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt




echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; cat /tmp/pimnt/etc/hosts ;   sed -i.bootstrap "s/127.0.1.1.*raspberrypi/127.0.1.1\t${iam}/g" /tmp/pimnt/etc/hosts ; cat /tmp/pimnt/etc/hosts; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; [ -d /tmp/pimnt/root/.ssh ] || mkdir -pv /tmp/pimnt/root/.ssh ;   ls -ld /tmp/pimnt/root/.ssh ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; [ -f /tmp/pimnt/root/.ssh/authorized_keys ] || touch /tmp/pimnt/root/.ssh/authorized_keys ; ls -l /tmp/pimnt/root/.ssh ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; fgrep --silent --file mpinet_rsa.pub /tmp/pimnt/root/.ssh/authorized_keys || cat mpinet_rsa.pub >> /tmp/pimnt/root/.ssh/authorized_keys ; fgrep --file mpinet_rsa.pub /tmp/pimnt/root/.ssh/authorized_keys ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt


echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; [ -d /tmp/pimnt/home/pi/.ssh ] || mkdir -pv /tmp/pimnt/home/pi/.ssh ;   ls -ld /tmp/pimnt/home/pi/.ssh ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; [ -f /tmp/pimnt/home/pi/.ssh/authorized_keys ] || touch /tmp/pimnt/home/pi/.ssh/authorized_keys ; ls -l /tmp/pimnt/home/pi/.ssh ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt

echo "${dev}" ; mkdir /tmp/pimnt ; mount ${dev}2 /tmp/pimnt ; fgrep --silent --file mpinet_rsa.pub /tmp/pimnt/home/pi/.ssh/authorized_keys || cat mpinet_rsa.pub >> /tmp/pimnt/home/pi/.ssh/authorized_keys ; fgrep --file mpinet_rsa.pub /tmp/pimnt/home/pi/.ssh/authorized_keys ; umount /tmp/pimnt ; rmdir -v /tmp/pimnt


echo "${dev}" ; eject ${dev}

