#!/bin/bash


getcameraargs() {
	ls /dev/video* | while read line; do
		echo -n "--device=$line "
	done
}

if [ -z "$1" ]; then
	echo "usage: start.sh <image-id>"
else
	sudo -v
	[[ $? -eq 0 ]] && sudo docker run -it $(getcameraargs) $1
fi
