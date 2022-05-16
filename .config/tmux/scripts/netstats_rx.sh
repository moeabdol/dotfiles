#!/usr/bin/env bash

function _capture_rates() {
	# read line into array
	while read -a line; do
		dev=${line[0]}
		if [ $dev = "$1" ]; then
			# echo "${line[0]} ${line[1]} ${line[2]} ${line[3]} ${line[4]}"
			rxrate=${line[1]}
			printf "%8s\n" $rxrate
		fi
	done
}

function _run_bmon_ascii_rx() {
	echo "Started parsing interface $1"
	bmon -R 3 -r 3 -bp "$1" -o ascii:diagram=list | _capture_rates "$1"
}

while [[ "$#" -gt 0 ]]; do
	case "$1" in
		-i|--interface) _run_bmon_ascii_rx "$2" ;;
		*) echo "unknown or missing args!"; exit 1 ;;
	esac
done

echo "no args passed!"
