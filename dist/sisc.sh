#!/bin/sh
if [ -z "$SISC_HOME" ]
then
   SISC_HOME="." #/usr/local/lib/sisc
fi

EXTENSIONS=""
java $JAVAOPT -classpath $SISC_HOME/sisc-opt.jar:$SISC_HOME/sisc.jar:$CLASSPATH -Dsisc.home=$SISC_HOME -Dsisc.heapfile=$SISC_HOME/sisc.shp sisc.REPL $EXTENSIONS "$@"
