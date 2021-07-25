#!/bin/env bash
if command -v siterebuild &> /dev/null
then
  SITEREBUILD=siterebuild
else
  SITEREBUILD=../siterebuild/siterebuild
fi
for i in `$SITEREBUILD -o %dir@%file`
do
  texdir=`echo $i | cut -d@ -f1 -`
  texfile=`echo $i | cut -d@ -f2 -`
  # either execute Makefile, or run make4ht directly
  pushd "$texdir"
  if test -f Makefile; then
    make
  else
    make4ht -m publish -l "$texfile"
  fi
  popd
  # echo pokus $pokus
  # echo world $world
done
