#!/bin/sh

export HOME=$SNAP_USER_DATA
export XDG_DATA_HOME=$SNAP_USER_DATA
export XDG_CONFIG_HOME=$SNAP_USER_DATA

# TODO - right now only C or "" works for this env
export LANG="C.UTF-8"

exec $SNAP/bin/"$@"
