#!/bin/sh
if [ ! -d "$SISC_HOME" ]
then
   SISC_HOME="`dirname $0`" #/usr/local/lib/sisc
fi

if [ -r "$HOME/sisc.properties" ]
then
  PROPERTIES="-p $HOME/sisc.properties"
elif [ -r "$SISC_HOME/sisc.properties" ]
then
  PROPERTIES="-p $SISC_HOME/sisc.properties"
fi

#If the rlwrap readline wrapper is in the path, enable it for SISC
if [ -x `which rlwrap` ]
then
   RLWRAP=rlwrap
fi

EXTENSIONS=""

$RLWRAP java $JAVAOPT -classpath $SISC_HOME/sisc-opt.jar:$SISC_HOME/sisc.jar:$SISC_HOME/sisc-lib.jar:$CLASSPATH -Dsisc.home=$SISC_HOME sisc.REPL -h $SISC_HOME/sisc.shp $PROPERTIES $EXTENSIONS "$@"
