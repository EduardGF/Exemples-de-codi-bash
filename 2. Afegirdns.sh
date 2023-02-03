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
