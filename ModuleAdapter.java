package sisc;

import java.text.*;
import java.util.*;
import sisc.data.*;

public abstract class ModuleAdapter extends Module {
    protected TreeMap bindings=new TreeMap();

    protected void define(String s, int id) {
        Symbol name=Symbol.get(s);
	bindings.put(name, new Integer(id));
    }

    public Symbol[] getModuleBindingNames() {
	Symbol[] slist=new Symbol[bindings.size()];
	int x=0;
	for (Iterator i=bindings.keySet().iterator(); 
	     i.hasNext();) 
	    slist[x++]=(Symbol)i.next();
	return slist;
    }


    public Value getBindingValue(Symbol name) throws NoSuchMethodError {
	Integer i=(Integer)bindings.get(name);
	try {
	    int inum=i.intValue();
	    return new BuiltinProcedure(this, name, inum);
	} catch (NullPointerException n) {
	    throw new NoSuchMethodError();
	}
    }

    public float getModuleVersion() {
	return 0.0f;
    }

    /* Localization and Internationalization */
    static Locale myLocale=Locale.getDefault();
    static MessageFormat formatter=new MessageFormat("");
    static ResourceBundle liMessages;

    static {
	formatter.setLocale(myLocale);
    }

    public ModuleAdapter() {
        try {
            liMessages = ResourceBundle.getBundle(getModuleName());
        } catch (MissingResourceException mr) {
            liMessages = Util.liMessages;
        }
    }

    protected static String getLiMessage(String mn) {
	String rv=liMessages.getString(mn);
	if (rv==null) return Util.liMessage(mn);
	else return rv;
    }

    public static String liMessage(String messageName) {
	return getLiMessage(messageName);
    }

    public static String liMessage(String messageName, String arg1) {
	return formatter.format(getLiMessage(messageName),
				new Object[] { arg1 });
    }

    public static String liMessage(String messageName, String arg1,
				   String arg2) {
	return formatter.format(getLiMessage(messageName),
				new Object[] { arg1, arg2 });
    }
}
