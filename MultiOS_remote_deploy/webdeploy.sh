#!/bin/bash

for host in `cat remhosts`
do
USR=devops

        echo "#############################"
        echo "Connection to $host"
        scp multios_websetup.sh $USR@$host:/tmp/
        echo "Executing Script on $host"
        ssh $USR@$host sudo /tmp/multios_websetup.sh
        ssh $USR@$host sudo rm -rf /tmp/multios_websetup.sh
        echo "###########################################"

done
