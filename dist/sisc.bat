@echo off
if NOT "%SISC_HOME%" == "" GOTO NOSET
set SISC_HOME=.
:NOSET
set EXTENSIONS=
java %JAVAOPT% -classpath %CLASSPATH%;%SISC_HOME%/sisc-opt.jar -Dsisc.home=%SISC_HOME% -Dsisc.heapfile=%SISC_HOME%\sisc.heap -jar %SISC_HOME%\sisc-base.jar %EXTENSIONS% %1 %2 %3 %4 %5 %6 %7 %8 %9

