#!/bin/bash

if [[ ! -n "$B2G_DIR" ]]; then
  B2G_DIR=$(cd `dirname $0`; pwd)
fi

. "$B2G_DIR/.config"
if [ $? -ne 0 ]; then
	echo Could not load .config. Did you run config.sh?
	exit -1
fi

for config in device/*/$DEVICE/config; do
	if [ -f $config ] ; then
		. $config
	fi
done

if [ -f "$B2G_DIR/.userconfig" ]; then
	. "$B2G_DIR/.userconfig"
fi
