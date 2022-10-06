#!/bin/sh


volume_control() 
{	
	if [[ "$1" = "-g" ]]
	then
		pactl -- get-sink-volume 0
	fi

	if [[ "$1" = "-s" ]]
	then
		var=$2
		if [[ -z "$var" ]]
		then
			echo "Please specify a volume level"
		else
			pactl -- set-sink-volume 0 "$2"
			if [[ ${var:0:1} = "-" ]]
			then
				echo "Volume reduced to ${var:1}"
			else
				echo "Volume increased to ${var}"
			fi
		fi
	fi
}

case "$1" in
	"-v") volume_control "$2" "$3" ;;

	"-g") echo "ha" ;;

esac

