package sisc.ser;

import java.io.IOException;

public interface Seekable {

    public void seek(long pos) throws IOException;
    public long getFilePointer() throws IOException;
}
