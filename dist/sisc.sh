#!/bin/sh
if [ -z "$SISC_HOME" ]
then
   SISC_HOME="." #/usr/local/lib/sisc
fi

EXTENSIONS=""
java $JAVAOPT -classpath $CLASSPATH:$SISC_HOME/sisc-opt.jar -Dsisc.home=$SISC_HOME -Dsisc.heapfile=$SISC_HOME/sisc.heap -jar $SISC_HOME/sisc-base.jar $EXTENSIONS "$@"
