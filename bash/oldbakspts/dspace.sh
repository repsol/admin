#!/bin/bash

RES=$(df -h / | awk '{print $4}'  | grep [0-99]%)
#RES=$(df -h  | grep [0-99]% )

VAR=${RES%?}

echo ${VAR}
