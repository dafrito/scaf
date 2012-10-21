#!/bin/bash

load_file() {
    file=$1
    if [ -f $file ]; then
        source $file
    fi;
}

# First, load some global settings
load_file /etc/scafrc
load_file $HOME/.scafrc

# Then construct a list of paths that may contain settings files. We'll
# need to iterate this list in reverse order (parents before children), so
# children can override their parent's settings.

valid_paths=
path=`pwd`
while [ "$path" != "/" ]; do
    valid_paths="$path $valid_paths"
    path=`dirname $path`
done;
valid_paths="/ $valid_paths"

for path in $valid_paths; do
    load_file $path/.scafrc
done;
