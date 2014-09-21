#!/bin/bash
#
#
# This script watches the trivia process and restarts it if it dies
# Written by adrenaline 9/19/14
#
#

cd /opt/trivi_lite-0.2.3/
daemon=$( ps -ef |grep triv[i] )

if [ "${daemon##*\/}" != 'trivi_lite.pl' ] ; then

	./trivi_lite.pl &
fi
