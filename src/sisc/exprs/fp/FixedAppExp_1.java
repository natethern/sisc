package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;

public class FixedAppExp_1 extends FixedAppExp_0 {
    public Immediate op0;

    public FixedAppExp_1(FixableProcedure p, Immediate op0) {
        super(p);
        this.op0=op0;
    }

    public Value getValue(Interpreter r) throws ContinuationException {
        return proc.apply(op0.getValue(r));
    }

    public Value express() {
        return list(sym("FixedAppExp"), proc.express(), 
                    ((Expression)op0).express());
    }

    public void serialize(Serializer s) throws IOException {
        super.serialize(s);
        s.writeExpression((Expression)op0);
    }

    public FixedAppExp_1() {}

    public void deserialize(Deserializer s) throws IOException {
        super.deserialize(s);
        op0=(Immediate)s.readExpression();
    }

    public boolean visit(ExpressionVisitor v) {
        return super.visit(v) && v.visit((Expression)op0);
    }
}
