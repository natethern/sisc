package sisc.contrib.servlets;

import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;

import sisc.*;
import sisc.data.*;

import java.util.Hashtable;

public class SchemeAppServlet extends HttpServlet {

    private String appName;

    private static Hashtable htmlEscapes = new Hashtable();

    static {
        htmlEscapes.put("&", "&amp;");          // &
        htmlEscapes.put("\"", "&quot;");        // "
        htmlEscapes.put(">", "&gt;");           // >
        htmlEscapes.put("<", "&lt;");           // <
        htmlEscapes.put("'", "&#39;");          // '
    }

    protected static String searchReplace(String in, Hashtable pairs) {
        StringBuffer out = new StringBuffer(in.length()*2);
        String c;
        String r = null;
        int len = in.length();
        for (int i = 0; i < len; i++)
            {
                c = in.substring(i, i+1);
                r = (String) pairs.get(c);
                if (r != null) out.append(r);
                else out.append(c);
            }
        return out.toString();
    }

    public void init()
        throws ServletException {
        appName	= getInitParameter("app-name");
        String heapFile	= getInitParameter("heap-file");
        String baseDir = getInitParameter("base-dir");
        String initExpr = getInitParameter("init-expr");
        AppContext ctx = new AppContext();
        Context.register(appName, ctx);
        Interpreter r = Context.enter(appName);
        String realFile = getServletContext().getRealPath(heapFile);
        try {
            ctx.loadEnv(r, new DataInputStream(new java.util.zip.GZIPInputStream(new FileInputStream(realFile))));
        } catch (IOException e) {
            throw new ServletException("unable to load heap file " + realFile, e);
        } finally {
            Context.exit();
        }
        try {
            r.eval("(current-directory \"" + getServletContext().getRealPath((null == baseDir) ? "/" : baseDir) + "\")");
            Procedure p = (Procedure)r.eval(initExpr);
            r.eval(p, new Value[] { new sisc.modules.S2J.JavaObject(this) });
        } catch (IOException e) {
            throw new ServletException("evaluating init-expr " + initExpr + " failed", e);
        } catch (SchemeException e) {
            throw new ServletException("calling init-expr " + initExpr + " failed", e);
        } finally {
            Context.exit();
        }
    }

    public void destroy() {
        String destroyExpr = getInitParameter("destroy-expr");
        if (null == destroyExpr) return;
        Interpreter r = Context.enter(appName);
        try {
            Procedure p = (Procedure)r.eval(destroyExpr);
            r.eval(p, new Value[] { new sisc.modules.S2J.JavaObject(this) });
        } catch (IOException e) {
            throw new RuntimeException("evaluating destroy-expr " + destroyExpr + " failed");
        } catch (SchemeException e) {
            throw new RuntimeException("calling destroy-expr " + destroyExpr + " failed");
        } finally {
            Context.exit();
        }
    }

    private String createResponse(String requestText, String responseText) {
        return "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\"><html><head><title>"+ appName + " Administration</title></head><body><h1>"+ appName + " Administration</h1><form method=\"POST\"><p><textarea name=\"request\" rows=\"10\" cols=\"80\">" + searchReplace(requestText, htmlEscapes) + "</textarea></p><p><input type=\"SUBMIT\" value=\"Evaluate\"></input></p><p><textarea name=\"response\" rows=\"10\" cols=\"80\">" + searchReplace(responseText, htmlEscapes) +"</textarea></p></form></body></html>";
    }
        
    public void doGet(HttpServletRequest request,
                      HttpServletResponse response)
        throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.print(createResponse("",""));
        return;
    }

    public void doPost(HttpServletRequest request,
                       HttpServletResponse response)
        throws IOException, ServletException {

        String ct = request.getContentType();


        if ("application/x-scheme".equals(ct))
            streamPost(request, response);
        else
            formPost(request, response);
    }
        
    public void formPost(HttpServletRequest request,
                         HttpServletResponse response)
        throws IOException, ServletException {

        String req = request.getParameter("request");
        Interpreter r = Context.enter(appName);
        String resp;
        try {
            resp = r.eval(req).write();
        } catch (SchemeException e) {
            resp = e.getMessage();
        } finally {
            Context.exit();
        }
        
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.print(createResponse(req, resp));
        return;
    }

    public void streamPost(HttpServletRequest request,
                           HttpServletResponse response)
        throws IOException, ServletException {

        sisc.compiler.Parser p = new sisc.compiler.Parser(new sisc.compiler.Lexer());
        InputPort inp = new sisc.data.InputPort(new BufferedReader(new InputStreamReader(request.getInputStream())));

        Interpreter r = Context.enter(appName);
        try {
            Value v = r.eval(p.nextExpression(inp));
            response.setContentType("application/x-scheme");
            OutputPort outp = new OutputPort(response.getWriter(), true);
            outp.write(v.write());
        } catch (SchemeException e) {
            response.getWriter().print(e.getMessage());
        } finally {
            Context.exit();
        }
        
    }
}

/*
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is SISC Servlets.
 * 
 * The Initial Developer of the Original Code is Matthias Radestock.
 * Portions created by Matthias Radestock are Copyright (C) 2000-2002
 * Matthias Radestock.  All Rights Reserved.
 * 
 * Contributor(s):
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
