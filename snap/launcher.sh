#!/bin/sh

export HOME=$SNAP_USER_DATA
export XDG_DATA_HOME=$SNAP_USER_DATA
export XDG_CONFIG_HOME=$SNAP_USER_DATA
export XDG_DATA_DIRS=$SNAP_USER_DATA

# must be set to empty-string to pass !setlocale(LC_CTYPE,"")
# file: src/newsbeuter.cpp
export LANG=""
export LC_CTYPE=""
export LC_MESSAGES=""

exec $SNAP/bin/"$@"
