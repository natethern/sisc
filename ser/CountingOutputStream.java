package sisc.ser;

import java.io.*;

public class CountingOutputStream extends FilterOutputStream {

    public int position;

    public CountingOutputStream(OutputStream out) {
        super(out);
        position=0;
    }

    public void write(int b) throws IOException {
        position++;
        out.write(b);
    }

    public void write(byte[] b, int offset, int len) throws IOException {
        position+=len;
        out.write(b, offset, len);
    }
}
