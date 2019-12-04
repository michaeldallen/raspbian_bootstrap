#!/bin/sh

set -e
set -u

# see: https://enter.thewhiterabbit.space/install-ansible-on-debian-raspbian/

# mda - 2017.06.22

setup_apt () {

    sdl_target='/etc/apt/sources.list.d/ansible.list'
    
    echo "checking '${sdl_target}'"
    if [ -f "${sdl_target}" ] ; then
	echo "got it"
    else
	echo "don't got it"
	${DEBUG:+echo "(would) "} touch "${sdl_target}"
	echo "created it"
    fi


    (
	echo 'deb http://httpredir.debian.org/debian jessie-backports main contrib non-free'
	echo 'deb-src http://httpredir.debian.org/debian jessie-backports main contrib non-free'
    ) | \
	while read l ; do
	    echo "checking '${sdl_target}' for '${l}'"
	    if fgrep -q "${l}" "${sdl_target}" ; then
		echo "got it"
	    else
		echo "don't got it"
		${DEBUG:+echo "(would) "} eval "echo '${l}' >> '${sdl_target}'"
		echo "added it"
	    fi
	done

    ${DEBUG:+echo "(would) "} apt-get update
    ${DEBUG:+echo "(would) "} apt-get --assume-yes dist-upgrade

}



setup_keys() {
    (
	echo '7638D0442B90D010'
	echo '8B48AD6246925553'
    ) | while read k ; do
	    echo "checking for key '${k}'"
	    if ! gpg --list-keys "${k}" ; then
		echo "don't got it"
		${DEBUG:+echo "(would) "} gpg --keyserver pgpkeys.mit.edu --recv-key "${k}"
		${DEBUG:+echo "(would) "} gpg -a --export "${k}" | apt-key add -
		echo "added it"
	    else
		echo "got it"
	    fi
	done
}


setup_ansible() {
    ${DEBUG:+echo "(would) "} eval "apt-get update && apt-get --target-release jessie-backports --assume-yes install ansible"
    ansible --version
    apt-cache policy ansible
}


main() {
    setup_apt
    setup_keys
    setup_ansible
}



main

#EOF
