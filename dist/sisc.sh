#!/bin/sh
LIBDIR=. #/usr/local/lib/sisc
java $JAVAOPT -DHEAP=$LIBDIR/sisc.heap -jar $LIBDIR/sisc.jar "$@"