package sisc;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import sisc.data.Value;
import java.util.Vector;

public class Test extends JFrame implements Runnable {
    
    Vector exprs=new Vector();
    Interpreter r;
    JTextArea ta;
    JTextField tf;
    JButton button;
    Thread t;

    public Test() {
	super("SISC interaction");
	JPanel pan=new JPanel(new BorderLayout());
	ta=new JTextArea(10,60);
	JScrollPane jsp=new JScrollPane(ta);
	
	pan.add(jsp, BorderLayout.CENTER);
	tf=new JTextField(60);
	tf.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    String text=tf.getText()+"\n";
		    tf.setText("");
		    ta.setCaretPosition(ta.getText().length());

		    exprs.addElement(text);
		    synchronized(exprs) {
			exprs.notify();
		    }
		}
	    });
	JPanel pan2=new JPanel();
	BoxLayout b=new BoxLayout(pan, BoxLayout.X_AXIS);
	pan2.add(tf);
	pan2.add(Box.createHorizontalGlue());
	button=new JButton("New Context");
	button.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) {
		    Test t=new Test(Interpreter.newContext(r));
		    t.show();
		}
	    });
	pan2.add(button);
	pan.add(pan2, BorderLayout.SOUTH);
	getContentPane().add(pan);
	pack();
	t=new Thread(this);
	t.start();
    }

    public Test(Interpreter r) {
	this();
	this.r=r;
    }

    public void run() {
	while (true) {
	    if (!exprs.isEmpty()) {
		String text=(String)exprs.firstElement();
		exprs.removeElementAt(0);
		ta.append(text);
		try {
		    Value v=r.eval(text);
		    ta.append(v.write());
		    ta.append("\n> ");
		} catch (Exception e2) {
		    e2.printStackTrace();
		}
		ta.setCaretPosition(ta.getText().length());
	    } else {
		synchronized(exprs) {
		    try {
			exprs.wait();
		    } catch (InterruptedException ie) {}
		}
	    }
	}
    }


    public static void main(String[] args) throws Exception {
	Interpreter r = REPL.createInterpreter(args);
	Test t=new Test(r);
	t.show();
    }
}

