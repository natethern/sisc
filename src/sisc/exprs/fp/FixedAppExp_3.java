package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.nativefun.NestedPrimRuntimeException;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;
import sisc.util.FreeReference;

public class FixedAppExp_3 extends FixedAppExp_2 {
    public Immediate op2;

    public FixedAppExp_3(Immediate op0, Immediate op1,
                         Immediate op2,
                         FreeReference ref) {
        super(op0, op1, ref);
        this.op2=op2;
    }

    public void setHosts() {
        super.setHosts();
        Utils.linkOptimistic(this, (Expression)op2, 2);
    }

    public Value doGetValue(FixableProcedure proc, Interpreter r) throws ContinuationException {
        return proc.apply(op0.getValue(r), op1.getValue(r), op2.getValue(r));
    }

    protected void revert() {
        revert(new Expression[] {(Expression)op0, (Expression)op1, (Expression)op2});
    }    
    
    public Value express() {
        return new Pair(sym("FixedAppExp"), new Pair(ref.getName(), 
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
