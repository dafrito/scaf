#!/bin/bash
PATH=/bin:/usr/bin

die() {
    echo $* >&2
    exit 1;
}

generate_scaffold() {
    file=$1;
    shift;

    # TODO Insert your scaffold here.
    # cp $SCAFDATA/example.sh $file

    if [ -n "$MODELINE" ]; then
        echo >>$file
        echo "# $MODELINE" >>$file
    fi
}

for file in $*; do
    mkdir -p `dirname $file`
    if [ -e $file ]; then
        echo "$file already exists, ignoring." >&2
    else
        generate_scaffold $file
    fi
done;
