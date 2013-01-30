#!/bin/bash
PATH=/bin:/usr/bin

die() {
    echo $* >&2
    exit 1;
}

APP=@@PROJECT_DASHES@@
RPMDIR=$HOME/rpmbuild
SPECFILE=@@PROJECT_DASHES@@.spec

mkdir -p $RPMDIR
pushd $RPMDIR && mkdir -p SOURCES SPECS BUILD RPMS SRPMS && popd

tarfile=$APP.tar.gz
tar czf $APP.tar.gz \
    --exclude-vcs \
    --exclude-backups \
    --exclude='release/**' \
    --exclude='**-wip' \
    --transform="s,^,$APP/,g" \
        $SPECFILE \
        Makefile.PL \
        lib \
        t || die "Failed to create tarfile"

cp -vu $tarfile $RPMDIR/SOURCES || die
cp -vu $SPECFILE $RPMDIR/SPECS || die
rpmbuild --ba $RPMDIR/SPECS/$SPECFILE || die

for package in `rpm -q --specfile ./$SPECFILE`; do
    arch=`echo $package | grep -E -o '[^.]+$$'`;
    filename="$RPMDIR/RPMS/$arch/$package.rpm";
    [ -e `basename $filename` ] || ln -s $filename;
done

# vim: set ts=4 sw=4 :
