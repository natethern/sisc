package sisc.modules;

import java.io.*;

import sisc.interpreter.*;
import sisc.nativefun.*;
import sisc.data.*;
import sisc.io.*;

/**
 * Scheme functions for manipulating files and directories.
 */
public class FileManipulation extends ModuleAdapter {

    static class FileHandle extends NamedValue {
        
        File f;

        public FileHandle(File f) {
            this.f=f;
        }

        public void display(ValueWriter w) throws IOException {
            super.displayNamedOpaque(w, "file-handle");
        }
    }

    protected static final int
        MAKEFILEHANDLE = 0, DIRECTORYQ = 1, FILEQ = 2, HIDDENQ = 3,
        EXISTSQ = 4, FILEHANDLEQ = 5, DIRLIST = 6;
        

    public FileManipulation() {
        define("make-file-handle" , MAKEFILEHANDLE);
        define("file-handle?"     , FILEHANDLEQ);
        define("file/hidden?"     , HIDDENQ);
        define("file/exists?"     , EXISTSQ);
        define("file/directory?"  , DIRECTORYQ);
        define("file/file?"       , FILEQ);
        define("directory/list"   , DIRLIST);
    }

    public static final FileHandle fileHandle(Value o) 
        throws ContinuationException {
        try {
            return (FileHandle)o;
        } catch (ClassCastException e) { typeError("filehandle", o); }
	return null;
    }

    public Value eval(int primid, Interpreter f)
        throws ContinuationException {
        switch (f.vlr.length) {
        case 1:
            switch(primid) {
            case MAKEFILEHANDLE:
                return new FileHandle(new File(string(f.vlr[0])));
            case FILEHANDLEQ:
                return truth(f.vlr[0] instanceof FileHandle);
            case DIRECTORYQ:
                return truth(fileHandle(f.vlr[0]).f.isDirectory());
            case FILEQ:
                return truth(fileHandle(f.vlr[0]).f.isFile());
            case EXISTSQ:
                return truth(fileHandle(f.vlr[0]).f.exists());
            case HIDDENQ:
                return truth(fileHandle(f.vlr[0]).f.isHidden());
            case DIRLIST:
                Pair p=EMPTYLIST;
                String[] contents=fileHandle(f.vlr[0]).f.list();
                for (int i=contents.length-1; i>=0; i--) 
                    p=new Pair(new SchemeString(contents[i]), p);
                return p;
            default:
                throwArgSizeException();
            }
        case 2:
                    default:
            throwArgSizeException();
        }
        return VOID;
    }
}
