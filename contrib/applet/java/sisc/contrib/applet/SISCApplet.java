package sisc.contrib.applet;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.zip.GZIPInputStream;

import sisc.*;
import sisc.ser.*;
import sisc.interpreter.*;

public class SISCApplet extends JApplet {

    public void init() {
        try {
            URL u=new URL(getDocumentBase(),"sisc.shp");
            URLConnection conn=u.openConnection();
            AppContext ctx = new AppContext();
            Context.register("main", ctx);
            Interpreter r = Context.enter("main");
            SeekableInputStream in=new MemoryRandomAccessInputStream(new GZIPInputStream(conn.getInputStream()));
            REPL.initializeInterpreter(r, new String[0], in);
            Context.exit();
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

