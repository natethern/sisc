package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class FixedAppExp_0 extends Expression implements Immediate {
    public FixableProcedure proc;

    public FixedAppExp_0(FixableProcedure p) {
        this.proc=p;
    }

    public void eval(Interpreter r) throws ContinuationException {
        r.nxp=null;
        r.acc=getValue(r);
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        return proc.apply();
    }

    public Value express() {
        return list(sym("FixedAppExp"), proc.express());
    }

    public void serialize(Serializer s) throws IOException {
        s.writeExpression(proc);
    }

    public FixedAppExp_0() {}

    public void deserialize(Deserializer s) throws IOException {
        proc=(FixableProcedure)s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return v.visit(proc);
    }
}
