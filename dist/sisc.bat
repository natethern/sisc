@echo off
set LIBDIR="."
set EXTENSIONS=""
java %JAVAOPT% -DHEAP=%LIBDIR%\sisc.heap -jar %LIBDIR%\sisc.jar %EXTENSIONS% %1 %2 %3 %4 %5 %6 %7 %8 %9

