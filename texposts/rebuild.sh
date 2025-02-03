#!/bin/sh
if ! command -v siterebuild &> /dev/null
then
SITEREBUILD=../siterebuild/siterebuild
else
SITEREBUILD=siterebuild
fi

# git clone https://github.com/michal-h21/make4ht
# cd make4ht
# make justinstall
# cd ..

export TEXINPUTS=.:/root/texmf//: 

$SITEREBUILD -l debug
# we use the custom output format for siterebuild, to be able to easily extract directory and filename in the later steps
for i in `$SITEREBUILD -o %dir@%file`
do
  texdir=`echo $i | cut -d@ -f1 -`
  texfile=`echo $i | cut -d@ -f2 -`
  # either execute Makefile, or run make4ht directly
  cd "$texdir"
  if test -f Makefile; then
    make
  else
    TEXINPUTS=.:/root/texmf//: make4ht -a debug -m publish -l "$texfile"
  fi
  cd ..
  # echo pokus $pokus
  # echo world $world
done
