package sisc.ser;

import java.io.*;

public interface SeekableDataInput extends Seekable, DataInput {

    public int read() throws IOException;
    public int read(byte[] b) throws IOException;
    public int read(byte[] b, int off, int len) throws IOException;
}
