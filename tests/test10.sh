#!/bin/bash

_file=$0
_raw2wav=$1
_dir=$2
_name=$3
_freqr=$4

# Clean if necessary
if [ $1 == "clean" ]; then
	set -x
	rm -f $_dir/$_name.dat $_dir/$_name.dat.wav
	exit
fi

# Test samplerate
#printf "file \"$0\":\t"
set -x
$_freqr -o $_dir/$_name.dat -w sw -a 5000 -s 88200 -r 128 || exit 101
$_raw2wav $_dir/$_name.dat || exit 102
