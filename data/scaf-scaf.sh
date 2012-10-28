#!/bin/bash
PATH=/bin:/usr/bin

# Description: Generate TODO Finish this

die() {
    echo $* >&2
    exit 1;
}

generate_scaffold() {
    file=$1;
    shift;

    # TODO Insert your scaffold here.
    # cp $SCAFDATA/scaf.foo $file

    if [ -n "$MODELINE" ]; then
        echo >>$file
        # TODO Ensure this comment is correct
        echo "# vim: set $MODELINE :" >>$file
    fi
}

if [ "$#" -eq 0 ]; then
    die "At least one file must be provided";
fi;

for file in $*; do
    mkdir -p `dirname $file`
    if [ -e $file ]; then
        echo "$file already exists, ignoring." >&2
    else
        generate_scaffold $file
    fi
done;
