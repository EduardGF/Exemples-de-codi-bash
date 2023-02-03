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

