#!/bin/bash
PATH=/bin:/usr/bin

die() {
    echo $* >&2
    exit 1
}

if  [ -z "$@@PROJECT_UPPER@@_INSTALLED" ]; then
    # We're running this from the source repository, so fake a few
    # things.

    # A (hopefully) usable link to the scaf executable
    @@PROJECT_UPPER@@=`realpath $0`

    # The root directory for scaf. In installed configurations, this
    # won't be as necessary, since we'll use /usr/share for scaffold
    # data and /usr/bin for scaf itself.
    @@PROJECT_UPPER@@DIR=`dirname $@@PROJECT_UPPER@@`
fi;

if [ ! -x $@@PROJECT_UPPER@@ ]; then
    die "No valid path to @@PROJECT@@. @@PROJECT_UPPER@@: $@@PROJECT_UPPER@@";
fi
export @@PROJECT_UPPER@@

if [ ! -d "$@@PROJECT_UPPER@@DIR" ]; then
    die "No valid path to @@PROJECT@@'s root directory. Attempted: $@@PROJECT_UPPER@@DIR"
fi;

usage() {
    echo "USAGE: @@PROJECT@@ TARGET [OPTIONS...]"
}

if [ "$#" -eq 0 ]; then
    usage >&2
    exit 1
fi;

TARGET=$1
shift

GREETING=${1:-hello}
shift

case "$GREETING" in
    hello) echo "Hello, $TARGET!" ;;
    bye) echo "Goodbye, $TARGET!" ;;
    hola|spanish) echo "Hola, $TARGET!" ;;
    *) echo "I don't recognize '$GREETING' as a greeting. :(" ;;
esac;

# vim: set ts=4 sw=4 et :
