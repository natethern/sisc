@echo off
set SISC_LIB="."
set EXTENSIONS=""
java %JAVAOPT% -DHEAP=%LIBDIR%\sisc.heap -jar %SISC_LIB%\sisc.jar %EXTENSIONS% %1 %2 %3 %4 %5 %6 %7 %8 %9

