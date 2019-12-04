ls | \
    grep '^io.mdabone.device.config.authorized_key.' | \
    while read key ; do
        echo key: ${key}
        user=`echo ${key} | sed 's/io.mdabone.device.config.authorized_key.\(.*\)-at-\(.*\)/\2/'`
        home=`getent passwd ${user} | cut -d: -f6`
        auth_keys="${home}/.ssh/authorized_keys"
        #echo user: $user
        #echo home: $home
        #echo keys: $auth_keys
        if [ ! -d /home/${user}/.ssh ] ; then 
            su -c "mkdir -pv ${home}/.ssh" ${user}
            if ! grep --silent "`cat ${key}`" ${auth_keys} ; then
                echo adding ${key} to ${auth_keys}
                cat ${key} | su -c "cat >> ${home}/.ssh/authorized_keys" ${user}
            fi
        fi
    done




