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

public class FixedAppExp_1 extends FixedAppExp_0 implements OptimisticHost {
    public Immediate op0;

    public FixedAppExp_1(Immediate op0, 
    		             FreeReference ref) {
        super(ref);
        this.op0=op0;
    }

    public void setHosts() {
        Utils.linkOptimistic(this, (Expression)op0, 0);
    }
    
    /* (non-Javadoc)
     * @see sisc.exprs.fp.OptimisticHost#alter(int, sisc.data.Expression)
     */
    public void alter(int uexpPosition, Expression replaceWith) {
        revert();
    }

    protected void revert() {
        revert(new Expression[] {(Expression)op0});
    }
    
    public Value doGetValue(FixableProcedure proc, Interpreter r) throws ContinuationException {
        return proc.apply(op0.getValue(r));
    }

    public Value express() {
        return list(sym("FixedAppExp"), ref.getName(), 
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
