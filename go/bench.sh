#!/bin/bash

    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    LGREEN=`echo "\033[0m\033[1;32m"`
    ENTER_LINE=`echo "\033[33m"`

cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

echo -e "${LGREEN}CPU model :${NORMAL} $cname${NORMAL}"
echo -e "${LGREEN}Number of cores :${NORMAL} $cores${NORMAL}"
echo -e "${LGREEN}CPU frequency :${NORMAL} $freq MHz${NORMAL}"
echo -e "${LGREEN}Total amount of ram :${NORMAL} $tram MB${NORMAL}"
echo -e "${LGREEN}Total amount of swap :${NORMAL} $swap MB${NORMAL}"
echo -e "${LGREEN}System uptime :${NORMAL} $up${NORMAL}"
