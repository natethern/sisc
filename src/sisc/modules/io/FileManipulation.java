package sisc.modules.io;

import java.io.*;
import java.net.*;
import java.net.MalformedURLException;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;

/**
 * Scheme functions for manipulating files and directories.
 */
public class FileManipulation extends IndexedProcedure {

    protected static final int DIRECTORYQ = 1,
        FILEQ = 2,
        HIDDENQ = 3,
        DIRLIST = 6,
        LASTMODIFIED = 7,
        SETLASTMODIFIED = 8,
        SETREADONLY = 9,
        LENGTH = 10,
        GETPARENTURL = 11,
        MAKEDIRECTORY = 12,
        MAKEDIRECTORIES = 13,
        RENAME = 14,
        DELETE = 15,
        READABLE = 16,
        WRITEABLE = 17;

    public static class Index extends IndexedLibraryAdapter {

        public Value construct(int id) {
            return new FileManipulation(id);
        }
        
        public Index() {
            define("file/hidden?", HIDDENQ);
            define("file/is-directory?", DIRECTORYQ);
            define("file/is-file?", FILEQ);
            define("file/is-readable?", READABLE);
            define("file/is-writeable?", WRITEABLE);
            define("directory/list", DIRLIST);
            define("file/last-modified", LASTMODIFIED);
            define("file/set-last-modified!", SETLASTMODIFIED);
            define("file/set-read-only!", SETREADONLY);
            define("file/length", LENGTH);
            define("file/rename!", RENAME);
            define("file/delete!", DELETE);
            define("_get-parent-url", GETPARENTURL);
            define("_make-directory!", MAKEDIRECTORY);
            define("_make-directories!", MAKEDIRECTORIES);
        }
    }
    
    public FileManipulation(int id) {
        super(id);
    }
    
    public FileManipulation() {}
    
    public static final File fileHandle(Value o) {
        URL u=url(o);
        if (!"file".equals(u.getProtocol()))
            throwPrimException(liMessage(IO.IOB, "notafileurl"));
        String path=URLDecoder.decode(u.getPath());
        return new File(path);
    }

    public Value doApply(Interpreter f) throws ContinuationException {
        switch (f.vlr.length) {
        case 1:
            switch(id) {
            case DIRECTORYQ:
                return truth(fileHandle(f.vlr[0]).isDirectory());
            case FILEQ:
                return truth(fileHandle(f.vlr[0]).isFile());
            case HIDDENQ:
                return truth(fileHandle(f.vlr[0]).isHidden());
            case READABLE:
                return truth(fileHandle(f.vlr[0]).canRead());
            case WRITEABLE:
                return truth(fileHandle(f.vlr[0]).canWrite());
            case DIRLIST:
                Pair p=EMPTYLIST;
                String[] contents=fileHandle(f.vlr[0]).list();
                for (int i=contents.length-1; i>=0; i--) 
                    p=new Pair(new SchemeString(contents[i]), p);
                return p;
            case LENGTH:
                return Quantity.valueOf(fileHandle(f.vlr[0]).length());
            case LASTMODIFIED:
                return Quantity.valueOf(fileHandle(f.vlr[0]).lastModified());
            case SETREADONLY:
                return truth(fileHandle(f.vlr[0]).setReadOnly());
            case DELETE:
                return truth(fileHandle(f.vlr[0]).delete());
            case GETPARENTURL:
                try {
                    return new SchemeString(fileHandle(f.vlr[0])
                                            .getParentFile().toURL().toString());
                } catch (MalformedURLException m) {
                    m.printStackTrace();
                }
                break;
            case MAKEDIRECTORY:
                return truth(fileHandle(f.vlr[0]).mkdir());
            case MAKEDIRECTORIES:
                return truth(fileHandle(f.vlr[0]).mkdirs());
            default:
                throwArgSizeException();
            }
        case 2:
            switch(id) {
            case SETLASTMODIFIED:
                return truth(fileHandle(f.vlr[0]).setLastModified(num(f.vlr[1]).longValue()));
            case RENAME:
                return truth(fileHandle(f.vlr[0]).renameTo(fileHandle(f.vlr[1])));
            default:
                throwArgSizeException();
            }
        default:
            throwArgSizeException();

        }
        return VOID;
    }
}
