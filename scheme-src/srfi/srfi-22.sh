#!/bin/sh
SCHEMEENV=`basename $0`
SOURCEFILE=$1
ARGS=$@
ARGLIST="'("
while [ $# -gt 0 ] 
do 
  ARGLIST="$ARGLIST\"$1\" "
  shift 1
done
ARGLIST="${ARGLIST})"

sisc -x -e "(srfi-22-prepare '$SCHEMEENV \"$SOURCEFILE\")" -c main

