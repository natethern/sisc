package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.nativefun.NestedPrimRuntimeException;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class FixedAppExp_3 extends FixedAppExp_2 {
    public Immediate op2;

    public FixedAppExp_3(FixableProcedure p, Immediate op0, Immediate op1,
                         Immediate op2) {
        super(p, op0, op1);
        this.op2=op2;
    }

    public Value getValue(Interpreter r) throws ContinuationException {
    	try {
            return proc.apply(op0.getValue(r), op1.getValue(r), op2.getValue(r));
        } catch (ClassCastException cc) {
            error(r, getName(),
                  liMessage(SISCB, "gotunexpectedvalue", cc.getMessage()),
	  					    cc);
        } catch (NestedPrimRuntimeException npr) {
            Procedure.error(r, getName(), npr);
        } catch (RuntimeException re) {
            //re.printStackTrace();
            String msg = re.getMessage();
            if (msg == null)
                msg = re.toString();
            error(r, proc.getName(), msg, re);
       }
        // Should be unreachable;
        return null;
    }

    public Value express() {
        return new Pair(sym("FixedAppExp"), new Pair(proc.express(), 
                                                     list(((Expression)op0).express(),
                                                          ((Expression)op1).express(),
                                                          ((Expression)op1).express())));
    }

    public void serialize(Serializer s) throws IOException {
        super.serialize(s);
        s.writeExpression((Expression)op2);
    }

    public FixedAppExp_3() {}

    public void deserialize(Deserializer s) throws IOException {
        super.deserialize(s);
        op2=(Immediate)s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && v.visit((Expression)op2);
    }
}
