package sisc.contrib.stl;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import sisc.*;
import sisc.data.Value;
import java.io.IOException;

public class SchemeContextTag extends TagSupport {

    static Interpreter main;

    public static Interpreter getMain() {
        return main;
    }

    public static void init() {
        if (getMain() == null) {
            AppContext ctx = new AppContext();
            Context.register("main", ctx);
            main=Context.enter("main");
            try {
                System.err.println("Initializing Scheme...");
                REPL.initializeInterpreter(main, new String[0],
                                           REPL.findHeap());
                System.err.println("Main interp:"+main);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    String name;

    public void setName(String name) {
        this.name=name;
    }

    public int doStartTag() {
        init();
        AppContext ctx=main.ctx;
        Context.register(name, ctx);
        pageContext.setAttribute("scheme-context", Context.enter(name));
        return EVAL_BODY_INCLUDE;
    }

    public int doEndTag() {
        Context.exit();
        return EVAL_PAGE;
    }
}
