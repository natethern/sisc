package sisc.compiler;

public interface Tokens {
    public int
	TT_NUMBER = 0,	  TT_STRING = 1,	TT_PAIR   = 2,
	TT_SYMBOL = 3,	  TT_ENDPAIR= 4,	TT_QUOTE  = 5,
	TT_DOT   = 6,     TT_UNQUOTE= 7,	TT_SHARP = 8,
	TT_BACKQUOTE = 9, TT_UNQUOTE_SPLICING = 10;
}
