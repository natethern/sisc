package sisc.ser;

import java.io.*;

public class MemoryRandomAccessInputStream extends SeekableInputStream {
    
    protected byte[] data;
    protected int filePointer;

    public MemoryRandomAccessInputStream(InputStream in) throws IOException {
        ByteArrayOutputStream bos=new ByteArrayOutputStream();
        int rc=0;
        byte[] buffer=new byte[65536];
        while (-1!=(rc=in.read(buffer))) {
            if (rc>0)
                bos.write(buffer, 0, rc);
        }
        bos.flush();
        data=bos.toByteArray();
    }

    public void seek(long pos) throws IOException {
        filePointer=(int)pos;
    }

    public long getFilePointer() throws IOException {
        return filePointer;
    }

    public int read() throws IOException {
        return data[filePointer++] & 0xff;
    }

    public int read(byte[] b, int off, int len) throws IOException {
        int rc=Math.min(len, data.length - filePointer);
        System.arraycopy(data, filePointer, b, off, rc);
        filePointer+=rc;
        return rc;
    }

    public int skipBytes(int bc) throws IOException {
        int rc=Math.min(bc, data.length - filePointer);
        filePointer+=rc;
        return rc;
    }
}
