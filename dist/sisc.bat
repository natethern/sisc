@echo off
if NOT "%SISC_HOME%" == "" GOTO NOSET
set SISC_HOME=.
:NOSET
set EXTENSIONS=
java %JAVAOPT% -classpath "%SISC_HOME%/sisc-opt.jar;%SISC_HOME%/sisc.jar;%SISC_HOME%/sisc-lib.jar;%CLASSPATH%" -Dsisc.home=%SISC_HOME% sisc.REPL %EXTENSIONS% -i %SISC_HOME%\sisc.shp %1 %2 %3 %4 %5 %6 %7 %8 %9

