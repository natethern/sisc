#!/bin/bash
SCHEMEENV=`basename $0`
SOURCEFILE=$1
shift 1

sisc srfi-22.scm -x -e "(srfi-22-prepare '$SCHEMEENV \"$SOURCEFILE\")" -c main -- "$@"

