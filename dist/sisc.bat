@echo off
set LIBDIR="."
java %JAVAOPT% -DHEAP=%LIBDIR%\sisc.heap -jar %LIBDIR%\sisc.jar %1 %2 %3 %4 %5 %6 %7 %8 %9

