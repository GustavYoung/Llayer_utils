#!/bin/bash
#copyright 2019 Gustavo Santana
#
#Hypervisor para el servicio de la "L"
#
#
#
cd /home/uslu/elements/
for dir in */
do
GENRE=$(basename "$dir")
DIR_TO_CHECK="/home/uslu/elements/$GENRE"
PATH_TO_EXCLUDE="/home/uslu/elements/vidfullscreen/*"

OLD_SUM_FILE="/home/uslu/Llayer_utils/db/$GENRE.txt"

if [ -e $OLD_SUM_FILE ]
then
    OLD_SUM=`cat $OLD_SUM_FILE`
else
    OLD_SUM="nothing"
fi

NEW_SUM=`find $DIR_TO_CHECK/* \! -path "$PATH_TO_EXCLUDE"  -print0| xargs -0 du -b --time --exclude=$PATH_TO_EXCLUDE | sort -k4,4 | sha1sum | awk '{print $1}'`

if [ "$OLD_SUM" != "$NEW_SUM" ]
then
    echo 'El Contenido ha cambiado generando nueva Playlist';
    if [[ `lsof | grep /home/uslu/elements/videos/` ]]
        then
        sleep 33;
        echo "espera por L activa" >> log_$(date +%Y_%m_%d).txt;
    fi
    sudo service Llayer-banners restart;
    sudo service Llayer-main restart;
    # update the OLD_STAT_FILE
    # update old sum
    echo $NEW_SUM > $OLD_SUM_FILE
fi
    echo 'No Hay cambios'
done
