package sisc.ser;

import java.io.*;

public class SeekableDataInputStream extends DataInputStream implements SeekableDataInput {

    protected Seekable sis;

    public SeekableDataInputStream(SeekableInputStream s) {
        super(s);
        sis=s;
    }

    public void seek(long pos) throws IOException {
        sis.seek(pos);
    }

    public long getFilePointer() throws IOException {
        return sis.getFilePointer();
    }
}
