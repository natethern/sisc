PATH=/usr/local/java/bin:$PATH
CLASSPATH="/home/scgmille/java/sisc/dist/sisc/sisc-lib.jar:/home/scgmille/java/sisc/dist/sisc/sisc.jar:/home/scgmille/java/sisc/dist/sisc/sisc-opt.jar:/home/scgmille/java/contrib/irc/lib/pircbot.jar:/home/scgmille/java/contrib/irc/sisc-pirc.jar:.:/usr/share/java/postgresql.jar:$CLASSPATH"
SISC_HOME=/home/scgmille/java/sisc/dist/sisc
JAVAOPT="-Dsisc.permitinterrupts=true"
export CLASSPATH SISC_HOME JAVAOPT PATH
screen sh ~/bin/sisc libs.scm ~/java/sisc/scheme-src/slib.scm streams.scm \
                 jdbc.scm amb.scm phrases.scm alice.scm random.scm \
                 state.scm time.scm ../pirc.scm db.scm ai.scm schemechan.scm \
                 bot.scm