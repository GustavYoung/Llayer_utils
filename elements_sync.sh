#!/bin/bash
# Actualizacion dummy realtime.
# Version Alpha 0.3 bugfix 045
#
#(C) 2018 Gustavo Santana
#For internal use only
#
#bugs? contact at gus.santana(at)icloud.com
currsh=$0
currpid=$$
runpid=$(lsof -t $currsh| paste -s -d " ")
if [[ $runpid == $currpid ]]
then
        touch /home/uslu/elements.lock
          ((sleep 3; echo "Ram OK") \
         & while !  rsync -avh -e "ssh -i /home/uslu/.ssh/id_rsa -p3113" --exclude "*.m3u" --include-from "/home/uslu/gstool/extensions.dll" --partial --bwlimit=1300 --delete --progress --log-file=/home/uslu/Llayer_utils/updatelogs/$(date +%Y%m%d)_realt.log uxmal-ftp@uxm3.uxmalstream.com:/home/uxm-ivan/elements/ /home/uslu/elements/;
           do
               echo "Todo listo";
               exit;
           done )
      rm /home/uslu/elements.lock
      exit;
else
    echo -e "\nPID($runpid)($currpid) ::: At least one of \"$currsh\" is running !!!\n"
    false
    exit 1
fi

