package sisc.contrib.applet;

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
            URLConnection conn=u.openConnection();
            AppContext ctx = new AppContext();
            Context.register("main", ctx);
            Interpreter r = Context.enter("main");
            InputStream in=new GZIPInputStream(new BufferedInputStream(conn.getInputStream()));
            REPL.initializeInterpreter(r, new String[0], in);
            Context.exit();
            SISCFrame sf=new SISCFrame();
            //	sf.pack();
            //	sf.show();
            getContentPane().add(sf);
            sf.input.grabFocus();
        } catch (Exception e) {
	    e.printStackTrace();
	}
    }
}

