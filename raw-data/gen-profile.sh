#!/bin/bash

task(){
   cmd=`echo "$1" | tr -s '\t' ' '`
   $cmd &
}

LANGS="af ar bg bn ca cs cy da de el en es et fa fi fr gu he hi hr hu id it ja kn ko lt lv mk ml mr ne nl no pa pl pt ro ru sk sl so sq sv sw ta te th tl tr uk ur vi zh-cn zh-tw"

N=`nproc`

(
	for lang in $LANGS; do
		((i=i%N)); ((i++==0)) && wait
		task "/usr/lib/jvm/jre-1.8.0/bin/java -jar langdetect.jar --genprofile -d wiki-abstracts $lang"
	done
	wait
)

