package sisc;

import sisc.data.*;
import java.io.*;

public class ApplyParentFrame extends Procedure {
    public CallFrame c;

    public ApplyParentFrame() {}
    public ApplyParentFrame(CallFrame cf) {
        this.c=cf;
    }

    public void apply(Interpreter r) throws ContinuationException {
        if (r.vlr.length==1) {
            r.acc=r.vlr[0];
        }
        else r.acc=new Values(r.vlr);
        r.pop(c.parent);
    }

    public String display() {
        return displayNamedOpaque("error continuation");
    }
}
