package sisc.ser;

import sisc.Util;
import sisc.data.Expression;
import sisc.data.Symbol;
import java.net.URL;
import java.net.MalformedURLException;
import java.io.*;
import java.util.*;

public class LibraryManager extends Util {
    
    protected static LibraryManager systemLibraryManager;

    public static LibraryManager getInstance() {
        if (systemLibraryManager == null)
            systemLibraryManager = new LibraryManager();
        return systemLibraryManager;
    }

    static class LoadableLibrary {
        URL path;
        Library handle;

        public LoadableLibrary(URL path) {
            this.path=path;
        }

        public LoadableLibrary(Library l) {
            this.handle=l;
        }

        public void open() throws IOException {
            if (handle==null) {
                SeekableDataInputStream sis;
                if (path.getProtocol().equals("file")) {
                    sis=new SeekableDataInputStream(
                         new BufferedRandomAccessInputStream(
                          new File(new File(path.getPath()), 
                                   path.getFile()).getCanonicalPath(),
                          "r", 8, 2048));
                } else {
                    sis=new SeekableDataInputStream(new MemoryRandomAccessInputStream(path.openStream()));
                }
                try {
                    handle=Library.load(sis);
                } catch (ClassNotFoundException cnf) {
                    cnf.printStackTrace();
                }
            }
        }

        public Library getLibrary() throws IOException {
            open();
            return handle;
        }
    }
    
    protected Map loadedLibraries;

    public LibraryManager() {
        loadedLibraries=new HashMap();
    }

    public Expression getExpression(Symbol name) throws IOException {
        for (Iterator i=loadedLibraries.keySet().iterator(); i.hasNext();) {
            Object key=i.next();
            LoadableLibrary ll=(LoadableLibrary)loadedLibraries.get(key);
            try {
                return ll.getLibrary().getLocalExpression(name);
            } catch (FileNotFoundException fnf) {
            }
        }
        throw new FileNotFoundException(liMessage(SISCB,
                                                  "namedlibbindingnotanywhere",
                                                  name.toString()));
    }

    public void addLibrary(Library l) {
        loadedLibraries.put(l.getName(), new LoadableLibrary(l));
    }


    public void addLibrary(String name, URL l) {
        loadedLibraries.put(name, new LoadableLibrary(l));
    }
        
    public boolean loadLibrary(String name) {
        //Should eventually utilize a load path
        try {
            URL u=new URL(name);
            addLibrary(name, u);
            return true;
        } catch (MalformedURLException mfu) {
            mfu.printStackTrace();
        } 
        return false;
    }
}
