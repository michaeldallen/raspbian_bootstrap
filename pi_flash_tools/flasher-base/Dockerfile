#BOF

FROM ubuntu:xenial


ENV \
        DEBIAN_FRONTEND noninteractive


RUN \
        apt-get update && apt-get --assume-yes dist-upgrade


RUN \
        apt-get update && apt-get --assume-yes install \
            apt-utils


RUN \
        apt-get update && apt-get --assume-yes install \
                curl \
                eject \
                file \
                hdparm \
                pv \
                rsync \
                sudo \
                udev \
                unzip \
                usbutils \
                util-linux \
	        \
	        cowsay


WORKDIR \
        /opt


RUN \
        curl -O http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-12/2019-07-10-raspbian-buster-lite.zip
RUN \
        unzip 2019-07-10-raspbian-buster-lite.zip

COPY \
     hyperiot-flash /opt/


#EOF
