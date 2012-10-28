#!/bin/bash
PATH=/bin:/usr/bin

die() {
    echo $* >&2
    exit 1
}

if  [ -z "$SCAF_INSTALLED" ]; then
    # We're running this from the source repository, so fake a few
    # things.

    # A (hopefully) usable link to the scaf executable
    SCAF=`realpath $0`

    # The root directory for scaf. In installed configurations, this
    # won't be as necessary, since we'll use /usr/share for scaffold
    # data and /usr/bin for scaf itself.
    SCAFDIR=`dirname $SCAF`
fi;

if [ ! -x $SCAF ]; then
    die "No valid path to scaf. SCAF: $SCAF";
fi
export SCAF

if [ ! -d "$SCAFDIR" ]; then
    die "No valid path to scaf's root directory. Attempted: $SCAFDIR"
fi;

# A directory that contains data used by scaf's types. Used by
# supported clients, so it must be exported.
SCAFDATA=$SCAFDIR/data
if [ ! -d "$SCAFDATA" ]; then
    die "No valid path to scaf's data directory. Attempted: $SCAFDATA"
fi;
export SCAFDATA

# A directory that contains all of scaf's supported types.
scaffolds=$SCAFDIR/types.d
if [ ! -d "$scaffolds" ]; then
    die "No valid path to scaf's types.d directory. Attempted: $scaffolds"
fi;

usage() {
    echo "USAGE: scaf [TYPE] FILE [OPTIONS...]"
    echo "Supported scaffolds:"
    for f in $scaffolds/*; do
        if [ -f $f ] && [ ! -h $f ]; then
            name=`basename $f`
            desc=`sed -nre 's/^.*Description:\s+//p' $f`
            # If these names get longer than 8 characters, we're going
            # to have to fix the tabs.
            if [ -n "$desc" ]; then
                echo "	$name		$desc"
            else
                echo "	$name"
            fi;
        fi;
    done;
}

if [ "$#" -eq 0 ]; then
    usage >&2
    exit 1
fi;

# The chosen scaffold type
export SCAFFOLD_TYPE=$1
shift

# Our first stab at a scaffold
scaffold=$scaffolds/$SCAFFOLD_TYPE

if [ ! -x $scaffold ]; then
    # We didn't recognize the scaffold type. Let's assume we were given an
    # actual file, with the assumption that the scaffold type could be coerced
    # from that file.
    first=$SCAFFOLD_TYPE
    set $first $*
    case "$first" in
        *.xsl|*.xslt)
            SCAFFOLD_TYPE=xslt
        ;;
        *.hpp|*.cpp|*.cxx|*.hxx|*.C|*.H)
            SCAFFOLD_TYPE=cpp
        ;;
        *.sh)
            SCAFFOLD_TYPE=sh
        ;;
        *)
            echo "No target file provided."  >&2
            echo >&2
            usage >&2
            exit 1
        ;;
    esac;
fi;

# Reset scaffold, since our type may have changed
scaffold=$scaffolds/$SCAFFOLD_TYPE
[ -x $scaffold ] || die "No scaffold for type: $type"

source $SCAFDIR/load-defaults.sh

source $scaffold $*;

# vim: set ts=4 sw=4 et :
