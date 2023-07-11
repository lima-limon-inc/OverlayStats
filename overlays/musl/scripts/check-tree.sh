#!/bin/bash

PWD=$(pwd)
PWD=$(dirname ${PWD})
list=$(find ${PWD} -iname "*.ebuild")

slist=$(for i in ${list}; do
	j=$(dirname $i)
	pkg=$(basename $j)
	j=$(dirname $j)
	cat=$(basename $j)
	echo "$cat/$pkg"
done | sort -u)

for i in $slist; do
	equery w $i
#	emerge -qvp $i
done
