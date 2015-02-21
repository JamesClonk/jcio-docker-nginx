#!/bin/bash
set -e
set -u

# usage check
if [ $# -ne 1 ]; then
	echo "usage: $0 <JCIO_HOSTNAME>"
	exit 1
fi

JCIO_HOSTNAME=$1

for file in `ls *.conf.tmpl`; do
	echo "Prepare $file -> ${file%.*}"
	sed "s/%JCIO_HOSTNAME%/${JCIO_HOSTNAME}/g" $file > ${file%.*}
done

exit 0
