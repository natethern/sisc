PATH=/usr/local/java/bin:$PATH
CLASSPATH="libs/pircbot.jar:libs/sisc-pirc.jar:libs/postgresql.jar:.:$CLASSPATH"
SISC_HOME=libs
JAVAOPT="-Dsisc.permitInterrupts=true -Dsisc.emitAnnotations=true -Dsisc.emitDebuggingSymbols=true"
export CLASSPATH SISC_HOME JAVAOPT PATH
cd anna
./server.sh &
ANNAPID=$!
echo $ANNAPID
cd ..

sh sisc/sisc ./libs.scc ./sarahbot.scc
kill $ANNAPID