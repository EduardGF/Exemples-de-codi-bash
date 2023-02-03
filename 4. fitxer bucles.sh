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

#Exemple 15 diff TO DO