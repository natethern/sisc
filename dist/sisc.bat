@echo off
set SISC_HOME="."
set EXTENSIONS=""
java %JAVAOPT% -Dsisc.home=%SISC_HOME% -Dsisc.heapfile=%LIBDIR%\sisc.heap -jar %SISC_HOME%\sisc.jar %EXTENSIONS% %1 %2 %3 %4 %5 %6 %7 %8 %9

