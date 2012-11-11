#!/bin/bash
PATH=/bin:/usr/bin

die() {
	echo $* >&2
	exit 1
}

REPODIR="$*"
[ -n "$REPODIR" ] || die "REPODIR was not specified"
[ -d $REPODIR ] || die "REPODIR does not exist: $REPODIR"

RPMDIR=$HOME/rpmbuild

# TODO Set the source path
SRCDIR=$HOME/src/@FILE@

cd $SRCDIR || die

./configure || die
make rpm || die

specfile=$SRCDIR/rpm.spec
if [ ! -e "$specfile" ]; then
    specfile=$RPMDIR/SPECS/`cat .fullname`.spec
    [ -e "$specfile" ] || die "No specfile found"
fi;

for package in `rpm -q --specfile $specfile`; do
	arch=`echo $package | grep -E -o '[^.]+$'`
	cp -v $RPMDIR/RPMS/$arch/$package.rpm $REPODIR || die
done
