package sisc.io.custom;

import sisc.data.Pair;
import sisc.data.Value;

public interface CustomPortProxy {

    public Pair getProcs();
    public void setHost(Value host);
    public Value getHost();
}
