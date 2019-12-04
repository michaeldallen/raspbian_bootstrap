#!/bin/bash

(echo -n "$(date) " ; echo "$@") >> //var/log/boot_test

echo mpinet_boot_test_logger

ansible localhost  --inventory=localhost, --connection=local --module-name=apt --args='name=emacs'
ansible localhost  --inventory=localhost, --connection=local --module-name=apt --args='name=vim'
ansible localhost  --inventory=localhost, --connection=local --module-name=file --args='path=/boot/ssh state=touch'

#EOF

