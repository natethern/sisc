PATH=/usr/local/java/bin:$PATH
CLASSPATH="/home/scgmille/java/contrib/irc/lib/pircbot.jar:/home/scgmille/java/contrib/irc/sisc-pirc.jar:.:/usr/share/java/postgresql.jar:$CLASSPATH"
SISC_HOME=/home/scgmille/java/contrib/irc/scheme/sarah/sisc
JAVAOPT="-Dsisc.permitInterrupts=true -Dsisc.emitAnnotations=true -Dsisc.emitDebuggingSymbols=true -Dsisc.slib=/usr/share/slib"
export CLASSPATH SISC_HOME JAVAOPT PATH
screen \
 sh sisc/sisc ./libs.scm ./sarahbot.scm
