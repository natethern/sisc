package sisc.applet;

import sisc.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.zip.*;

public class SISCApplet extends JApplet {

    public void init() {
	try {
	    URL u=new URL(getDocumentBase(),"sisc.heap");
	    System.err.println(u);
	    URLConnection conn=u.openConnection();
	    AppContext ctx = new AppContext();
	    Context.register("main", ctx);
	    Interpreter r = Context.enter("main");
	    InputStream in=new GZIPInputStream(new BufferedInputStream(conn.getInputStream()));
	    REPL.initializeInterpreter(r, new String[0], new DataInputStream(in));
	    SISCFrame sf=new SISCFrame(r);
	    //	sf.pack();
	    //	sf.show();
	    getContentPane().add(sf);
	    sf.input.grabFocus();
	} catch (Exception e) {
	    e.printStackTrace();
	}
    }
}

