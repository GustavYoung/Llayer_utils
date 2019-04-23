#!/bin/bash
cd /home/uslu/libgpng/
resolution=$(tvservice -s | grep -oP '[[:digit:]]{1,4}x[[:digit:]]{1,4} ')
a="1920x1080 "
b="1280x720 "
c="720x480 "
d="320x240 "

if [ "$resolution" == "$a" ]
    then /home/uslu/libgpng/glibimg -l 30 -x 0 -y 0 1080.png;
    bash logo1.sh & exit
fi
if [ "$resolution" == "$b" ]
    then /home/uslu/libgpng/glibimg -l 30 -x 0 -y 0 720.png;
    bash logo1.sh & exit
fi
if [ "$resolution" == "$c" ] 
    then /home/uslu/libgpng/glibimg -l 30 -x 0 -y 0 480.png;
    bash logo1.sh & exit
fi
if [ "$resolution" == "$d" ] 
then exit



#./glibimg -b 0 -l 3 Overlay.png &
#raspivid -t 0
#killall pngview
