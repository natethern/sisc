#!/bin/sh
if [ -z "$SISC_LIB" ]
then
   SISC_LIB="." #/usr/local/lib/sisc
fi

EXTENSIONS=""
java $JAVAOPT -DHEAP=$SISC_LIB/sisc.heap -jar $SISC_LIB/sisc.jar $EXTENSIONS "$@"