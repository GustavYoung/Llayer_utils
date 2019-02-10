#!/bin/bash
#Copyright 2018 Gustavo Santana
#(C) Mirai Works LLC
#
sleep 1;
# Nombre de instancia para que no choque con la de uxmalstream

resolution=$(tvservice -s | grep -oP '[[:digit:]]{1,4}x[[:digit:]]{1,4} ')
a="1920x1080 "
b="1280x720 "
c="720x480 "
d="320x240 "

SERVICE="Banner_layer_L";

BANNERPATH="/home/uslu/elements/banners";

echo "$resolution"

if [[ "$resolution" == "$a" ]] then 
        ( while :
        do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null;
        then
        sleep 1;
	else
	for entry in $BANNERPATH/*
	do
	/home/uslu/Llayer_utils/banner_sleep 3600;
        /home/uslu/Llayer_utils/bannerimg2 -l -10 -k "$entry";
	#sleep 240;
	done )
exit;
fi
if [[ "$resolution" == "$b" ]] then 
        ( while :
        do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null;
        then
        sleep 1;
	else
        for entry in $BANNERPATH/*
        do
        /home/uslu/Llayer_utils/banner_sleep 3600;
        /home/uslu/Llayer_utils/bannerimg2 -l -10 -k "$entry";
        #sleep 240;
        done )
exit;
fi
if [[ "$resolution" == "$c" ]] then 
        ( while :
        do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null;
        then
        sleep 1;
	else
        for entry in $BANNERPATH/*
        do
        /home/uslu/Llayer_utils/banner_sleep 3600;
        /home/uslu/Llayer_utils/bannerimg2 --win '26 37 692 443' -a fill -l -10 -k "$entry";
        #sleep 240;
        done )
exit;
fi
if [[ "$resolution" == "$d" ]] then 

exit;



#./glibimg -b 0 -l 3 Overlay.png &
#raspivid -t 0
#killall pngview
