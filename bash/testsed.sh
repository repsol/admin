#!/bin/bash

sed 's/Robyn/Mike/' testsed.txt > testsed1.txt 

cat testsed1.txt > testsed.txt
chmod 700 testsed.txt
rm -r testsed1.txt

