#!/bin/bash
if [ -z "$1" ]
then
  USERID=`id -u`
  if [ $USERID != 0 ]
  then
    echo This script must be run as root if installing to the default path.
    exit 1
  fi
  INSTALL_DIR=/usr/local/bin
else
  INSTALL_DIR=$1
fi
if [ -z "$2" ]
then
  SRCDIR="scheme-src/srfi-22"
else
  SRCDIR=$2
fi

echo This script will install the srfi-22 support scripts in $INSTALL_DIR.
echo If this is acceptable, press enter now, otherwise press CTL-C.
echo ""
echo "You can call this script with a different install dir as an argument."
read

pushd .
cd $SRCDIR
cp srfi-22.sh $INSTALL_DIR
cd $INSTALL_DIR
ln -s srfi-22.sh scheme-r4rs
ln -s srfi-22.sh scheme-r5rs
ln -s srfi-22.sh scheme-srfi-0
ln -s srfi-22.sh scheme-srfi-7
ln -s srfi-22.sh scheme-srfi-55
ln -s srfi-22.sh scheme-ieee-1178-1900
popd
