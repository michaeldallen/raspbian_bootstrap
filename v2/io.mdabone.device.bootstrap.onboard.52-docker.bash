# see: https://gist.github.com/alexellis/fdbc90de7691a1b9edb545c17da2d975

if which docker ; then 
    echo no action taken
else
    curl -sSL get.docker.com | sh
    usermod pi -aG docker
    
    dphys-swapfile swapoff
    dphys-swapfile uninstall
    update-rc.d dphys-swapfile remove
    
    if ! grep --silent 'cgroup_enable=cpuset cgroup_memory=1' /boot/cmdline.txt ; then 
        sed -i 's/$/ cgroup_enable=cpuset cgroup_memory=1/' /boot/cmdline.txt
        echo update /boot/cmdline.txt
    fi
fi 
