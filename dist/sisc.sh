#!/bin/sh
if [ -z "$SISC_HOME" ]
then
   SISC_HOME="`dirname $0`" #/usr/local/lib/sisc
fi

EXTENSIONS=""
java $JAVAOPT -classpath $SISC_HOME/sisc-opt.jar:$SISC_HOME/sisc.jar:$SISC_HOME/sisc-lib.jar:$CLASSPATH -Dsisc.home=$SISC_HOME sisc.REPL $EXTENSIONS -i $SISC_HOME/sisc.shp "$@"
