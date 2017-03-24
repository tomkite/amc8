#!/bin/bash

print_usage() {
    echo " "
    echo "usage: "
    echo "    $0 <session_dir>"
    echo " "
    echo "examples: "
    echo "    $0 session02"
    echo " "
}
  
if [[ $# < 1 ]]; then
    print_usage;
    exit
fi

if [[ -z $VIRTUAL_ENV ]]; then
    export WORKON_HOME=~/data/geek/venv
    source /usr/local/bin/virtualenvwrapper.sh
    workon amc
elif [[ $VIRTUAL_ENV != *"amc" ]]; then
    echo "Previous virtual ==> env ${prev_venv}. ***EXIT ***"
    exit 
fi

if [ -d "$1" ] ; then
    files=`ls $1/*.md`;
elif [ -f "$1" ]; then
    files=$1;
fi

for f in $files;
do
#    base=${f##*/} # turn /the/path/foo.txt to foo.txt
#    basebase=${base%.md} # turn foo.txt to foo
    basebase=${f%.md} # turn foo.txt to foo
    echo "markdown2 $f > ${basebase}.html"
done
