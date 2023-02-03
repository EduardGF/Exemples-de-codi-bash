# Exemples-de-codi-bash
 Exemples basics de codi Bash
-------------------------------
#!/bin/bash

#Això es un comentari

#EXEMPLE DEFINICIÓ VARIABLES

echo "### EXEMPLE 1 definició de variables ###"

nomvariable=22
echo nomvariable #mostra nomvariable
echo $nomvariable #mostra 22
echo '$nomvariable' #mostra $variable a causa de les ' '
echo "$nomvariable" #mostra 22
echo "Variable no definida: $variablenodefinida" #No mostra res
echo --"### FI EXEMPLE 1 ###"--
echo -e "\n"

#EXEMPLE NUMERIC
echo "### EXEMPLE 2 JUGUEM AMB NÚMEROS ###"
v=1337 #defineixo un valor
z=$v #copio el CONTINGUT ($)n de v a la z
echo $z
z=$[1228 + 1] #realització suma
echo $z
z=$[1228 - 10] #realització resta
echo $z
echo "### FI EXEMPLE 2 ###"
echo -e "\n"

#EXEMPLE READ i SUMA
echo "### EXEMPLE 3 READ i SUMA ###"
echo "Entra el 1r valor"
read valor1
echo "Entra 2n valor"
read valor2
suma=$[valor1 + valor2]
echo "Resultat de la suma:  $suma"
echo "### FI EXEMPLE 3 ###"
echo -e "\n"

#EXEMPLE \n i \t
echo "### EXEMPLE 4 \n i \t ###"
echo -e  "Fare un salt \n de linea"
echo -e "Ara tabulo \t tabulo"
echo "Cal afegir -e perque tot funcioni"
echo "### FI EXEMPLE 4 ###"
echo -e "\n"


#EXEMPLE read i locate
echo "### EXEMPLE 5 read i locate ###"
echo "Quin fitxer vols buscar?"
read fitxerbusqueda
sudo updatedb #actualitzo BBDD del locate
echo "Vols buscar: $fitxerbusqueda"
locate $fitxerbusqueda #busco el fitxer 
echo "### FI EXEMPLE 5 ###"
echo -e "\n"

#EXEMPLE read i locate
echo "### EXEMPLE 6 ###"
rm fileroute2 #borro el fitxer si ja existia (execuxió previa de lescript)
rm fileroute
touch fileroute2 #creo fitxer de nou
touch fileroute	
echo "Guardo taula de rutes"
netstat -r > fileroute #Guardo taula rutes actual al fitxer fileroute
echo "Entra destí"
read ip
echo "Entra mask"
read mask
echo "Entra gateway atencio!!! ha de ser valid sino ERROR"
read gate
#Pregunto (read) a l'usuari per tot el necessari
sudo route add -net $ip netmask $mask gw $gate #introdueixo nova ruta
echo "Ruta introduida"
netstat -r > fileroute2 #torno a guardar el contingut de la taula de rutes a un altre fitxer
echo -e "\n"
echo -e "Diferencia entre fitxers:"
diff fileroute fileroute2 #consulto les diferencies entre fitxers
sudo route del -net $ip netmask $mask gw $gate #esborro la ruta que he afegir per no deixar brossa a la taula :)
echo "### FI EXEMPLE 6 ###"
echo -e "\n"
#!/bin/bash
#Modificació /etc/hosts (nom-@Ip)

#guardo contingut en un fitxer backup
rm fileback
touch fileback
rm noudns
touch noudns

cat /etc/hosts > fileback
clear #netejo la pantalla

echo -e "Et mostro la configuració\n"
echo -e "\n"
cat fileback

echo -e "En quina posició (linea) vols introduir la nova @IP -nom??\n"
echo -e "La 1a comença en 1\n"
read linea

head fileback -n $linea > noudns
echo -e "Entra el nom"
read nom
echo -e "Entra ip"
read ip
echo -e "$ip \t $nom" >> noudns
h=`wc -l < fileback`
z=$[h - linea]
tail fileback -n $z >> noudns
cp noudns /etc/hosts
#!/bin/bash

#Exemple 7 comparacio variable amb constant
echo Entra numero
read number
if [ $number -gt "5" ]
then
	echo es mes gran que 5
fi
#Tambe es pot if i then a la mateix linea emprant ;
if [ $number -gt "7" ]; then
echo es mes gran que 7; fi
#-------------------------------------------------------------
###########COMPARADORS########################
#  -lt <
#  -gt >
#  -le <=
#  -ge >=
#  -eq ==
#  -ne !=
###############################################

#Exemple 8 comparacio cadenes
echo entra la password
read pass
if [ $pass = "pepe" ]
then
	echo password correcte
else
	echo password incorrecte
fi
#--------------------------------------------------------------
###########COMPARADORS STRINGS#################
#  s1=s2
#  s1!=s2
#  -n s1 is not null
#  -z s1 is null
###############################################
#Exemple 9 case
echo "Que vols menjar?"
read menu
case "$menu" in
	"pasta")
		echo hidrats per la nit no !
	;;
	"verdura")
		echo vegguie
	;;
	*)
		echo no ho tens clar?
	;;
esac

#Exemple 9 bis funció fora del document

source scriptextern.sh

#Exemple 9 funcions en bash
HELLO=Hello
function hello {
	local HELLO=World
	echo $HELLO
}
echo  $HELLO
hello
echo $HELLO


#Exemple 10 variables de programa
echo "Variable 1 $1 Variable 2 $2 Variable 3 $3"
echo "Tens $# parametres"
###############################################
#Anem a jugar amb les variables de programa
function suma(){
	sum=0
	while [ $# -gt 0 ]
	do 
		sum=$[sum+$1]
		shift  #VA passant de $2 a $1 , $3 a $2 etc
	done
	echo "La suma val $sum"
}
echo cridem la funcio amb 9 parametres
suma 1 2 3 4 5 6 7 8 9
#!/bin/bash

#Exemple 10 bucle 
for i in `ls`
do
	if [ -f $i ]
	then
		echo "$i és un fitxer"
	fi
	if [ -d $i ]
	then
		echo "$i es un directori"
	fi
done
#Exemple 11 exit status
#exit
#Exemple 12 bucle
for i in `seq 1 10`; do
echo $i
done

#Exemple 13 while
count=0
while [ $count -lt 10 ]; do
	echo Entra numero major de 10 per sortir
	read count
done 

#Exemple 14 bucle tornem a primaria
i=0
echo "Entra taula de multiplicar!"
read n
while [ $i -le 10 ]
do
	v=$[n*i]
	echo "$n per $i = $v"
	i=$[i+1]
done
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

















