#!/bin/bash
PATH=/bin:/usr/bin

# Description: Generate TODO Write a one-line description of this scaffold

die() {
    echo $* >&2
    exit 1;
}

realname() {
    if [ -n "$OWNER" ]; then
        echo $OWNER
    else
        # Extract a name from the passwd file
        grep "^`whoami`" /etc/passwd | cut -d: -f5
    fi;
}

generate_scaffold() {
    project=$1
    shift;

    # TODO Insert the scaffold directory
    rsync -avzih $SCAFDATA/YOUR_SCAFFOLD_DIR/ $project || die

    pushd $project || die
    project=`pwd`
    project=`basename $project`

    email=${EMAIL:-TODO@example.com}
    website=${WEBSITE:-http://www.TODO.com}

    if [ ! -e .scafrc ] || ! grep -q 'PROJECT=' .scafrc; then
        echo "PROJECT=$project" >>.scafrc
    fi;

    # TODO Insert any additional file creation here

    $SCAF license LICENSE

    # Substitute any relevant args
    find -type f | xargs sed -ri \
        -e "s/@@PROJECT@@/$project/g" \
        -e "s|@@WEBSITE@@|$website|g" \
        -e "s/@@YEAR@@/`date +%Y`/g" \
        -e "s/@@DATE@@/`date +'%a %b %d %Y'`/g" \
        -e "s:@@OWNER@@:`realname`:g" \
        -e "s|@@EMAIL@@|$email|g";

    # TODO Ensure this modeline insertion is correct
    if [ -n "$MODELINE" ]; then
        for sourcefile in `find . -name '*.pl'`; do
            if ! grep -q 'vim:' $sourcefile; then
                echo >>$sourcefile
                echo "# vim: set $MODELINE :" >>$sourcefile
            fi;
        done;
    fi;

    if [ -z "$NO_GIT" ] && [ ! -e .git ]; then
        # Set up git
        git init .
        git commit -m"Initial commit" --allow-empty
        git add .

        # Commit everything for our initial commit
        # TODO Ensure this commit comment works for you
        git commit -m"Initial scaffold for this project"
        git tag scaffold
    fi;
}

files=
for arg in $*; do
    case "$arg" in
        -f|--force) FORCE=true ;;
        -*) die "Unrecognized command: $arg" ;;
        *) files="$files $arg" ;;
    esac
done;
set $files

if [ "$#" -eq 0 ]; then
    die "At least one file must be provided";
fi;

for file in $*; do
    mkdir -p `dirname $file`
    if [ -z "$FORCE" ] && [ -e $file ]; then
        echo "$file already exists, ignoring." >&2
    else
        generate_scaffold $file
    fi
done;
