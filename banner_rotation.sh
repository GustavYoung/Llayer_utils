#!/bin/bash
#Copyright 2018 Gustavo Santana
#(C) Mirai Works LLC
#
sleep 30;

# Nombre de instancia para que no choque con la de uxmalstream
SERVICE="Banner_layer_L";

BANNERPATH="/home/uslu/elements/banners";

# infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep 1;
else
	for entry in $BANNERPATH/*
	do
	/home/uslu/Llayer_utils/banner_sleep 3600;
        /home/uslu/Llayer_utils/bannerimg2 -l -10 -k "$entry";
	#sleep 240;
	done
fi
done
