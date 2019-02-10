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

if [ "$resolution" == "$a" ]
then
        boxed="--win 0,0,1920,1080";
elif [ "$resolution" == "$b" ]; 
then
        boxed="--win 0,0,1280,720";
elif [ "$resolution" == "$c" ]; 
then
        boxed="--win 23,37,695,443";
elif [ "$resolution" == "$d" ]; 
then
        exit;
fi
echo "$boxed"
# infinite loop!
while true; do
        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
        sleep 1;
else
	for entry in $BANNERPATH/*
	do
	/home/uslu/Llayer_utils/banner_sleep 3600;
        /home/uslu/Llayer_utils/bannerimg2 $boxed -l 10 -k "$entry";
	#sleep 240;
	done
fi
done
#./glibimg -b 0 -l 3 Overlay.png &
#raspivid -t 0
#killall pngview
