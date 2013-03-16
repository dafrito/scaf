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

# TODO Ensure the source path is correct
SRCDIR=$HOME/src/@FILE@

cd $SRCDIR || die

BUILDDIR=repomaker.$$

# TODO Ensure the build process is correct
mkdir -p $BUILDDIR || die
cd $BUILDDIR || die
../configure || die
make rpm || die

specfile=rpm.spec
if [ ! -e "$specfile" ]; then
    specfile=`basename $SRCDIR`.spec
fi;
if [ ! -e "$specfile" ]; then
    specfile=$RPMDIR/SPECS/`cat .fullname`.spec
fi;
if [ ! -e "$specfile" ]; then
    die "No specfile found"
fi

for package in `rpm -q --specfile $specfile`; do
	arch=`echo $package | grep -E -o '[^.]+$'`
	cp -v $RPMDIR/RPMS/$arch/$package.rpm $REPODIR || die
done

cd .. || die
rm -rf $BUILDDIR
