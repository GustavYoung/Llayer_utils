# Llayer_utils
En caso de que no tenga usuario ingresar al Servidor uxmal-ftp:

Agregar el usuario nuevo usar el siguiente comando (reemplazar heineken por el nombre del nuevo cliente):

sudo adduser uxm-heineken

generar el password https://www.random.org/passwords/ en ese sitio y la regla es que sea de 10 caracteres de largo y le das click en generate passwords escoges uno de la lista y es el que se va a usar en el cliente en la rasp usar los siguientes comandos 

acceder con filezillla a la carpeta del usuario nuevo 

Crear la carpeta elements y dentro de la misma crear las carpetas banners y videos

ahora dentro de la rasp hay que entrar a la terminal y dar el comando 

En caso de que ya tenga usuario asignado comenzar desde aqui!!

git clone https://github.com/GustavYoung/Llayer_utils.git

después los siguientes 2 comandos:

mkdir /home/uslu/elements
mkdir /home/uslu/elements/videos
mkdir /home/uslu/elements/banners

en la rasp abrir el mc y copiar desde el servidor la carpeta adplay-alone que está dentro de la carpeta adplay

uxmal-ftp@uxm3.uxmalstream.com:3113/home/uxm3-bk/CLIENTES/desarrollo

 buscar la carpeta adplay-alone y copiarla a la carpeta home de uslu (mismo nivel de donde esta la carpeta uxmalstream)

salir de mc y volver a abrirlo para realizar la siguiente operación:

1.- desde la carpeta /uxmalstream/streamer copiar la carpeta node_modules a el interior de la carpeta adplay-alone,.



2.- copiar los 3 modulos 
dbus-native, 
omxplayer-controll-ucp 
y omxplayer-controll3 

adentro de la carpeta que acabamos de copiar /adplay-alone/node_modules

3.- Instalar Servicios

sudo cp /home/uslu/Llayer_utils/Llayer-main /etc/init.d/Llayer-main
sudo cp /home/uslu/Llayer_utils/Llayer-banners /etc/init.d/Llayer-banners

sudo chmod +x /etc/init.d/Llayer-main
sudo chmod +x /etc/init.d/Llayer-banners

sudo update-rc.d Llayer-main defaults
sudo update-rc.d Llayer-banners defaults


abrir el crontab (sudo crontab -e) y poner las siguientes líneas:

*/3 * * * * bash /home/uslu/Llayer_utils/elements_sync.sh
*/3 * * * * bash /home/uslu/Llayer_utils/Le_watch_dog.sh

Parchar la app de los flotantes 

sudo cp /home/uslu/Llayer_utils/fspatch/video.signal.sh /home/uslu/adsplayer/video.signal.sh

depues dar cd adplay-alone/ y dentro de la carpeta adplay-alone ejecutar npm install

Probar:
 para validar que todo funcione bien editar el archivo con la ruta del cliente en la linea 16 cambiar uxm-ivan por el usuario que se creo al principio de la guia:

vim /home/uslu/Llayer_utils/elements_sync.sh

probar que se descarguen los archivos desde el cliente en caso necesario editar ruta
sudo bash /home/uslu/Llayer_utils/elements_sync.sh


probar que el mecanismo se ejecute 
sudo bash /home/uslu/Llayer_utils/Llayer_trigger.sh

reiniciar completamente la rasp.

sudo reboot
