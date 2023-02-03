#!/bin/bash
echo Entra numero
read number
case "$number" in

1)
	#DIALOG=${DIALOG=dialog}
	dialog --title "Reproductor" --begin 0 0 --backtitle "Subtitol" --clear --msgbox "Hola" 10 30
;;
2)

	dialog --title "Message"  --yesno "Are you having fun?" 6 25
	resposta=$?
	echo $resposta #0 si 1 no 255 esc
;;
3)

	dialog --title "Input"  --clear --inputbox "Are you having fun?" 600 205 2> file
	cat file
;;
4)

	dialog --title "Input"  --passwordbox "Are you having fun?" 10 30 2> file
	cat file
;;
5)

	dialog --title "Input" --insecure \
	--passwordbox "Are you having fun?" \
	 10 30 2> file
	cat file
;;
6)

	dialog --title "Input" --menu "Tria opcio" 15 50 4 \
	Data/time "Mostra Hora" \
	Editor "Edita" \
	Exit "Surt" \
	2> file
	cat file
;;
7)

	FILE=`dialog --stdout --fselect $HOME/ 15 50`
	echo $FILE
;;
8)
	netstat -rn > aux.file
	dialog --textbox aux.file 20 90
;;
9)
	#Alumnos deben hacer menu --checklist
	#Alumnos deben hacer otras opciones 1 minimo 
;;
esac

