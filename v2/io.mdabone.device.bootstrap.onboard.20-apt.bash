#!/bin/bash

food=$(echo $0 | sed 's/\.bash$/.food/')
cmd="env DEBIAN_FRONTEND=noninteractive apt-get -q -y install $(cat ${food})"
echo "(about to) ${cmd}"
eval ${cmd}

#EOF
