package sisc.compiler;

import sisc.util.Util;
import sisc.data.Symbol;
import java.util.Map;
import java.util.HashMap;
import sisc.env.SymbolicEnvironment;

public abstract class CompilerConstants extends Util {
    
    //Various integer constants
    public static final int 
        SYNTACTIC_TOKEN_COUNT = 9,
        PROGRAM=0, APPLICATION=1, LAMBDA=2, _IF=3, BEGIN=4, QUOTE=5, SET=6, 
        DEFINE=7, MAKEANNOTATION=8, LETREC=9, FIX=10, UNKNOWN=-1, 
        TAIL=1, COMMAND=2, PREDICATE=4, REALTAIL=8;
    
    public static final Map SYNTACTIC_TOKENS=new HashMap(SYNTACTIC_TOKEN_COUNT);
    
    //Define the core syntactic constructs of the interpreter
    static final Syntax
        SYN_QUOTE  = syntax("quote", QUOTE),
        SYN_PROGRAM= syntax("program", PROGRAM),
        SYN_BEGIN  = syntax("begin", BEGIN),
        SYN_IF     = syntax("if", _IF),
        SYN_DEFINE = syntax("define", DEFINE),
        SYN_SET    = syntax("set!", SET),	
        SYN_LAMBDA = syntax("lambda", LAMBDA),
        SYN_LETREC = syntax("letrec", LETREC),
        SYN_FIX = syntax("fix", FIX),
        SYN_ANNOT  = syntax("annotate", MAKEANNOTATION);
    
    static Syntax syntax(String name, int id) {
        Syntax s=new Syntax(id);
        s.setName(Symbol.get(name));
        SYNTACTIC_TOKENS.put(name, s);
        SYNTACTIC_TOKENS.put(new Integer(id), s);
        return s;
    }
	
    static void extendenv(SymbolicEnvironment env, String s, Syntax syn) {
        Symbol name=Symbol.get(s);
        env.define(name, syn);
    }       

    static final Symbol 
        VARNAME=Symbol.get("var-name"),
        PROCNAME=Symbol.get("proc-name"),
        _LETREC=Symbol.get("letrec");
}
