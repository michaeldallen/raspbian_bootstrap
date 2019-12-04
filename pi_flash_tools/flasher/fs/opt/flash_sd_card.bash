#!/bin/bash

set -e
set -u

IMG="2018-10-09-raspbian-stretch-lite.img"
HOST_DEVICE_MAP="mpinet.host_device_map.v4"


${DRYRUN:+echo "would: "} echo running with DRYRUN set

if [ "${IAM:-unset}" = "unset" ] ; then
    echo -n "hostname? "
    read IAM
fi
${DEBUG:+} echo "IAM: ${IAM}"



if [ "${DEV:-unset}" = "unset" ] ; then
    echo -n "device? "
    read DEV
fi
${DEBUG:+} echo "DEV: ${DEV}"



do_flash_image () {
    ./hyperiot-flash ${UNATTENDED:+-f} -d ${DEV} ${IMG}
}

do_enable_ssh () {
    mkdir /tmp/pimnt
    mount ${DEV}1 /tmp/pimnt
    ls -l /tmp/pimnt
    touch /tmp/pimnt/ssh
    ls -l /tmp/pimnt
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_install_host_device_map () {
    mkdir /tmp/pimnt
    mount ${DEV}1 /tmp/pimnt
    ls -l /tmp/pimnt
    [ -f "/tmp/pimnt/${HOST_DEVICE_MAP}" ] || cp -v "${HOST_DEVICE_MAP}" "/tmp/pimnt/${HOST_DEVICE_MAP}"
    ls -l /tmp/pimnt
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_install_tag_hostname () {
    mkdir /tmp/pimnt
    mount ${DEV}1 /tmp/pimnt
    ls -l /tmp/pimnt
    [ -f /tmp/pimnt/mpinet.hostname.lkg ] || echo ${IAM} > /tmp/pimnt/mpinet.hostname.lkg
    ls -l /tmp/pimnt
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_disable_user_pi () {
    mkdir /tmp/pimnt
    mount ${DEV}2 /tmp/pimnt
    grep pi /tmp/pimnt/etc/shadow
    sed -i.bootstrap 's/^\(pi:\)[^:]*\(:.*\)/\1x\2/' /tmp/pimnt/etc/shadow
    grep pi /tmp/pimnt/etc/shadow
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_configure_hostname () {
    mkdir /tmp/pimnt
    mount ${DEV}2 /tmp/pimnt
    cat /tmp/pimnt/etc/hostname
    echo "${IAM}" > /tmp/pimnt/etc/hostname
    cat /tmp/pimnt/etc/hostname

    cat /tmp/pimnt/etc/hosts
    sed -i.bootstrap "s/127.0.1.1.*raspberrypi/127.0.1.1\t${IAM}/g" /tmp/pimnt/etc/hosts
    cat /tmp/pimnt/etc/hosts
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_add_root_ssh_keys () {
    mkdir /tmp/pimnt
    mount ${DEV}2 /tmp/pimnt
    [ -d /tmp/pimnt/root/.ssh ] || mkdir -pv /tmp/pimnt/root/.ssh
    ls -ld /tmp/pimnt/root/.ssh
    
    [ -f /tmp/pimnt/root/.ssh/authorized_keys ] || touch /tmp/pimnt/root/.ssh/authorized_keys
    ls -l /tmp/pimnt/root/.ssh

    fgrep --silent --file mpinet_rsa.pub /tmp/pimnt/root/.ssh/authorized_keys || cat mpinet_rsa.pub >> /tmp/pimnt/root/.ssh/authorized_keys
    fgrep --file mpinet_rsa.pub /tmp/pimnt/root/.ssh/authorized_keys
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}


do_add_pi_ssh_keys () {
    mkdir /tmp/pimnt
    mount ${DEV}2 /tmp/pimnt
    [ -d /tmp/pimnt/home/pi/.ssh ] || mkdir -pv /tmp/pimnt/home/pi/.ssh
    ls -ld /tmp/pimnt/home/pi/.ssh

    [ -f /tmp/pimnt/home/pi/.ssh/authorized_keys ] || touch /tmp/pimnt/home/pi/.ssh/authorized_keys
    ls -l /tmp/pimnt/home/pi/.ssh

    fgrep --silent --file mpinet_rsa.pub /tmp/pimnt/home/pi/.ssh/authorized_keys || cat mpinet_rsa.pub >> /tmp/pimnt/home/pi/.ssh/authorized_keys
    fgrep --file mpinet_rsa.pub /tmp/pimnt/home/pi/.ssh/authorized_keys
    umount /tmp/pimnt
    rmdir -v /tmp/pimnt
}





${DRYRUN:+echo "would: "} do_flash_image
${DRYRUN:+echo "would: "} do_enable_ssh
${DRYRUN:+echo "would: "} do_install_host_device_map
${DRYRUN:+echo "would: "} do_install_tag_hostname
${DRYRUN:+echo "would: "} do_disable_user_pi
${DRYRUN:+echo "would: "} do_configure_hostname
${DRYRUN:+echo "would: "} do_add_root_ssh_keys
${DRYRUN:+echo "would: "} do_add_pi_ssh_keys

#EOF
