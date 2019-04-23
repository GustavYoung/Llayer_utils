#!/bin/bash
#Copyright 2018 Gustavo Santana
#(C) Mirai Works LLC
#Desactivamos el puto cursor >P
sleep 100;

# Nombre de instancia para que no choque con la de uxmalstream
SERVICE="Elements_v2_launch";

# infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep 1;
else
        sudo bash /home/uslu/Llayer_utils/elements_sync.sh;
        date;
        sleep 241;
#       done
fi
done
