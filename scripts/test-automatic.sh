#!/bin/bash

echo "#########################################"
echo "########## Tests automaticos  ###########"
echo "#########################################"

echo "#----------# COMIENZA test palabras con acentos #----------#"

hashOutput0Automatic=$(sha256sum ./outputs-aut/output0-aut.txt | cut -d ' ' -f1)

./tp0 -i ./inputs/input0.txt -o ./outputs/output0.txt

hashOutput0Program=$(sha256sum ./outputs/output0.txt | cut -d ' ' -f1)

if [ $hashOutput0Automatic = $hashOutput0Program ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test palabras con acentos #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test con caritas #----------#"

hashOutput1Automatic=$(sha256sum ./outputs-aut/output1-aut.txt | cut -d ' ' -f1)

./tp0 -i ./inputs/input1.txt -o ./outputs/output1.txt

hashOutput1Program=$(sha256sum ./outputs/output1.txt | cut -d ' ' -f1)

if [ $hashOutput1Automatic = $hashOutput1Program ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test con caritas #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test con entrada estandar #----------#"

hashOutputStdinAutomatic=$(sha256sum ./outputs-aut/outputStdin-aut.txt | cut -d ' ' -f1)

./tp0 --output ./outputs/outputStdin.txt < ./inputs/inputStdin.txt

hashOutputStdinProgram=$(sha256sum ./outputs/outputStdin.txt | cut -d ' ' -f1)

if [ $hashOutputStdinAutomatic = $hashOutputStdinProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test con entrada estandar #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test con salida estandar #----------#"

hashOutputStdoutAutomatic=$(sha256sum ./outputs-aut/outputStdout-aut.txt | cut -d ' ' -f1)

./tp0 --input ./inputs/inputStdout.txt > ./outputs/outputStdout.txt

hashOutputStdoutProgram=$(sha256sum ./outputs/outputStdout.txt | cut -d ' ' -f1)

if [ $hashOutputStdoutAutomatic = $hashOutputStdoutProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test con salida estandar #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test con entrada y salida estandar #----------#"

hashOutputStdinStdoutAutomatic=$(sha256sum ./outputs-aut/outputStdinStdout-aut.txt | cut -d ' ' -f1)

./tp0 < ./inputs/inputStdinStdout.txt > ./outputs/outputStdinStdout.txt

hashOutputStdinStdoutProgram=$(sha256sum ./outputs/outputStdinStdout.txt | cut -d ' ' -f1)

if [ $hashOutputStdinStdoutAutomatic = $hashOutputStdinStdoutProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test con entrada y salida estandar #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test menu version (-V) #----------#"

hashOutputMenuVAutomatic=$(sha256sum ./outputs-aut/outputMenuVersion-aut.txt | cut -d ' ' -f1)

./tp0 -V > ./outputs/outputMenuV.txt

hashOutputMenuVProgram=$(sha256sum ./outputs/outputMenuV.txt | cut -d ' ' -f1)

if [ $hashOutputMenuVAutomatic = $hashOutputMenuVProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test menu version (-V) #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test menu version (--version) #----------#"

hashOutputMenuVersionAutomatic=$(sha256sum ./outputs-aut/outputMenuVersion-aut.txt | cut -d ' ' -f1)

./tp0 --version > ./outputs/outputMenuVersion.txt

hashOutputMenuVersionProgram=$(sha256sum ./outputs/outputMenuVersion.txt | cut -d ' ' -f1)

if [ $hashOutputMenuVersionAutomatic = $hashOutputMenuVersionProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test menu version (--version) #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test menu help (-h) #----------#"

hashOutputMenuHAutomatic=$(sha256sum ./outputs-aut/outputMenuHelp-aut.txt | cut -d ' ' -f1)

./tp0 -h > ./outputs/outputMenuH.txt

hashOutputMenuHProgram=$(sha256sum ./outputs/outputMenuH.txt | cut -d ' ' -f1)

if [ $hashOutputMenuHAutomatic = $hashOutputMenuHProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test menu version (-h) #----------#"

echo "#-----------------------------------------------------#"

echo "#----------# COMIENZA test menu help (--help) #----------#"

hashOutputMenuHelpAutomatic=$(sha256sum ./outputs-aut/outputMenuHelp-aut.txt | cut -d ' ' -f1)

./tp0 --help > ./outputs/outputMenuHelp.txt

hashOutputMenuHelpProgram=$(sha256sum ./outputs/outputMenuHelp.txt | cut -d ' ' -f1)

if [ $hashOutputMenuHelpAutomatic = $hashOutputMenuHelpProgram ] 
then 
	echo "OK"
else
	echo "ERROR"
fi

echo "#----------# FIN test menu version (--help) #----------#"

echo "#-----------------------------------------------------#"

echo "#########################################"
echo "####### FIN Tests automaticos  ###########"
echo "#########################################"