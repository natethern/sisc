package sisc.exprs.fp;

import java.io.*;
import sisc.data.*;
import sisc.exprs.AppExp;
import sisc.exprs.FreeReferenceExp;
import sisc.interpreter.*;
import sisc.nativefun.FixableProcedure;
import sisc.nativefun.NestedPrimRuntimeException;
import sisc.ser.Serializer;
import sisc.ser.Deserializer;
import sisc.util.ExpressionVisitor;
import sisc.util.FreeReference;
import sisc.util.UndefinedVarException;

public class FixedAppExp_0 extends Expression 
    implements Immediate, OptimisticExpression {

    transient FixableProcedure proc;
    public FreeReference ref;
    public OptimisticHost host;
    public int uexpPosition;
    
    public FixedAppExp_0(FreeReference ref) {
        this.ref=ref;
    }

    public void setHosts() {}
    
    public void setHost(OptimisticHost host, int uexpPos) {
        this.host=host;
        uexpPosition=uexpPos;
    }
    
    public void eval(Interpreter r) throws ContinuationException {
        r.nxp=null;
        r.acc=getValue(r);
    }

    public Value doGetValue(FixableProcedure proc, Interpreter r) throws ContinuationException {
        return proc.apply();
    }
    
    public Value getValue(Interpreter r) throws ContinuationException {
    	try {
            Expression e=ref.getValue();
            if (e!=proc) {
                //If the definition has changed (or has never been seen before)
                //check if its still fixable.  If not, revert to the safe expression
                if (proc==null || (e instanceof FixableProcedure)) {    
                    proc=(FixableProcedure)e;
                } else {
                    revert();
                }
            }
        	return doGetValue(proc, r);
        } catch (ClassCastException cc) {
            try {
                if (ref.getValue() instanceof FixableProcedure) {
                    error(r, getName(),
                            liMessage(SISCB, "gotunexpectedvalue", cc.getMessage()),
                            cc);
                } else {
                    revert();
                }
            } catch (UndefinedVarException udv) {
                revert();
            }
        } catch (NestedPrimRuntimeException npr) {
            Procedure.error(r, getName(), npr);
        } catch (OptimismUnwarrantedException uwe) {
            throw uwe;
        } catch (RuntimeException re) {
            //re.printStackTrace();
            String msg = re.getMessage();
            if (msg == null)
                msg = re.toString();
            error(r, ref.getName(), msg, re);
        } catch (UndefinedVarException ue) {
        	revert();
        }
        // Should be unreachable;
        return null;
    }

    protected void revert() {
        revert(ZV);
    }

    protected void revert(Expression[] rands) {
        AppExp safeExpr=new AppExp(new FreeReferenceExp(ref), rands, APPEVAL, false);
        host.alter(uexpPosition, safeExpr);
		if (safeExpr instanceof OptimisticHost) {
            ((OptimisticHost)safeExpr).setHosts();
        }
        throw new OptimismUnwarrantedException();
		
	}

	public Value express() {
        return list(sym("FixedAppExp"), ref.getName());
    }

    public void serialize(Serializer s) throws IOException {
        ref.serialize(s);
        s.writeExpression((Expression)host);
        s.writeInt(uexpPosition);
    }

    public FixedAppExp_0() {
        ref=new FreeReference();
    }

    public void deserialize(Deserializer s) throws IOException {
        ref.deserialize(s);
        host=(OptimisticHost)s.readExpression();
        uexpPosition=s.readInt();
    }

    public boolean visit(ExpressionVisitor v) {
        return ref.visit(v) && v.visit((Expression)host);
    }
}
