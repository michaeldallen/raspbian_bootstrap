#BOF

FROM ubuntu:noble

# Debian stuff
#
WORKDIR \
    /opt

ENV \
    DEBIAN_FRONTEND noninteractive

RUN \
    apt-get update && apt-get --assume-yes dist-upgrade

RUN \
    apt-get update && apt-get --assume-yes install \
        \
        jq \
        apt-utils \
        bsdmainutils \
        curl \
        eject \
        file \
        hdparm \
        less \
        libffi-dev \
        libssl-dev \
        pv \
        python \
        python-pip \
        rsync \
        sudo \
        udev \
        unzip \
        usbutils \
        util-linux \
        vim \
        \
        cowsay


# Raspbian stuff
#
ARG RASPBIAN_IMG=2019-07-10-raspbian-buster-lite.zip
ARG RASPBIAN_LOC=http://director.downloads.raspberrypi.org/raspbian_lite/images/raspbian_lite-2019-07-12

RUN \
    curl -O ${RASPBIAN_LOC}/${RASPBIAN_IMG}

RUN \
    unzip ${RASPBIAN_IMG}


# Python stuff
#
RUN \
    pip install --upgrade pip

RUN \
    pip install ansible==2.5


# mpinet stuff
#
COPY \
    fs/opt/ \
    /opt/




#EOF
