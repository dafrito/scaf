#!/bin/bash
PATH=/bin:/usr/bin

die() {
    echo $* >&2
    exit 1;
}

for f in $*; do
    mkdir -p `dirname $f`

    # TODO Insert your scaffold here.
    # cp $SCAFDATA/example.sh $f

    if [ -n "$MODELINE" ]; then
        echo >>$f
        echo "# $MODELINE" >>$f
    fi
done;
