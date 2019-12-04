#!/bin/bash

apt-get update

cmd="apt-get -q -y dist-upgrade"

echo "(about to) ${cmd}"
eval ${cmd}

#EOF
