#!/bin/sh
LIBDIR=. #/usr/local/lib/sisc
EXTENSIONS=""
java $JAVAOPT -DHEAP=$LIBDIR/sisc.heap -jar $LIBDIR/sisc.jar $EXTENSIONS "$@"