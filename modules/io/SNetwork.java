package sisc.modules.io;

import java.net.*;
import java.io.*;
import sisc.io.*;
import sisc.data.*;
import sisc.interpreter.*;
import sisc.nativefun.*;

/*
 *   <ttl>, <port> Integer
 *   <inet address> String
 *   <socket> Opaque type
 *   <tcp-socket> Opaque type
 *   <udp-socket> Opaque type
 *   <mcast-socket> Opaque type
 *   <server-socket> Opaque type
 
 *   (close-socket <socket>) => <void>
 *   (open-tcp-listener <port> . <inet address>) => <server-socket>
 *   (accept-tcp-socket <server-socket>) => <tcp-socket>
 *   (open-tcp-socket <host> <port>) => <tcp-socket>
 *
 *   (open-socket-input-port <socket>) => <input port>
 *   (open-socket-output-port <socket>) => <output-port>
 
 *   (open-udp-socket <listen port> . <packet size>) => <udp socket>
 *   (open-udp-socket <host> <send port> <listen port>) => <udp socket>
 
 *   (open-multicast-socket <port> . <packet size>) => <mcast-socket>
 *   (open-multicast-socket <group> <port> . <packet size>) => <mcast-socket>
 *   (join-multicast-group <socket> <group>) => <void>
 *   (leave-multicast-group <socket> <group>) => <void>
 *   (set-multicast-ttl! <socket> <ttl>) => <void>
 
 *   (get-host-ip-by-name <inet address>) => <inet address>
 *   (get-host-name-by-ip <inet address>) => <inet address>
 *   (get-local-host) => <inet address>
 *
 *   (set-so-timeout! <tcp socket> <timeout>) => <void>
 */

public class SNetwork extends ModuleAdapter {

    static final Symbol SNETB=Symbol.intern("sisc.modules.io.Messages");

    protected static final int
	GET_LOCAL_HOST=0, GET_HOST_NAME_BY_IP=1, GET_HOST_IP_BY_NAME=2,
	SET_MULTICAST_TTL=3, LEAVE_MULTICAST_GROUP=4,
	JOIN_MULTICAST_GROUP=5, OPEN_MULTICAST_SOCKET=6,
	OPEN_UDP_SOCKET=9, ACCEPT_TCP_SOCKET=7,
	OPEN_SOCKET_OUTPUT_PORT=10, OPEN_SOCKET_INPUT_PORT=11,
	OPEN_TCP_SOCKET=12,
	OPEN_TCP_LISTENER=13, CLOSE_SOCKET=14,
	SET_SO_TIMEOUT=15, OPEN_UDP_LISTEN_SOCKET=16, SOCKETQ=17,
        SERVERSOCKETQ=18;
   
    interface Closable {
        void close() throws IOException;
    }

    abstract class SchemeSocket extends Value implements Closable {
        public abstract void close() throws IOException;
        abstract SchemeInputPort getInputPort(Interpreter r) throws IOException, ContinuationException;
        abstract SchemeOutputPort getOutputPort(Interpreter r, boolean autoflush) throws IOException, ContinuationException;
    }

    class SchemeServerSocket extends Value implements Closable {
        protected ServerSocket s;

        public SchemeServerSocket(ServerSocket s) {
            this.s=s;
        }

        public void display(ValueWriter w) throws IOException {
            w.append("#<").append(liMessage(SNETB, "tcplistensocket")).append('>');
        }

        public void close() throws IOException {
            s.close();
        }
    }


    class SchemeTCPSocket extends SchemeSocket {
        protected Socket s;

        public SchemeTCPSocket(Socket s) {
            this.s=s;
        }

        public void display(ValueWriter w) throws IOException {
            w.append("#<").append(liMessage(SNETB, "tcpsocket")).append('>');
        }

        public void close() throws IOException {
            s.close();
        }

        public void setSoTimeout(int ms) throws SocketException {
            s.setSoTimeout(ms);
        }

        public SchemeInputPort getInputPort(Interpreter r) throws IOException, ContinuationException {
            return new StreamInputPort(new BufferedInputStream(s.getInputStream()));
        }

        public SchemeOutputPort getOutputPort(Interpreter r, 
					boolean autoflush) throws IOException, ContinuationException {
            return new StreamOutputPort(s.getOutputStream(),
                                        autoflush);
        }
    }

    class UDPInputStream extends InputStream {
        protected DatagramSocket ds;
        protected DatagramPacket p;
        byte[] buffer;
        protected int bp, blen;

        public UDPInputStream(DatagramSocket ds, int packet_size) {
            this.ds=ds;
            buffer=new byte[packet_size];
            p=new DatagramPacket(buffer, packet_size);
        }

        protected void receive() throws IOException {
            ds.receive(p);
            blen=p.getLength();
            byte[] buf=p.getData();
            System.arraycopy(buf, 0, buffer, 0, blen);
            bp=0;
            p=new DatagramPacket(buffer, buffer.length);
        }

	public int available() {
	    return blen-bp;
	}

        public int read() throws IOException {
            if (bp<blen)
                return buffer[bp++];
            else {
                receive();
                return read();
            }
        }

        public int read(byte[] b, int off, int len) throws IOException {
            if (bp<blen) {
                int btc=Math.min(len, blen-bp);
                System.arraycopy(buffer, bp, b, off, btc);
                bp+=btc;
                return btc;
            } else {
                receive();
                return read(b, off, len);
            }
        }
    }

    
    class UDPOutputStream extends OutputStream {
        protected DatagramPacket p;
        protected DatagramSocket ds;
	protected InetAddress host;
	protected int port;
        byte[] buffer=new byte[4096];

        public UDPOutputStream(DatagramSocket ds, InetAddress host, int port) {
            this.ds=ds;
	    this.host=host;
	    this.port=port;
            p=new DatagramPacket(buffer, buffer.length, host, port);
        }

        public void write(int b) throws IOException {
            buffer[0]=(byte)b;
            p.setData(buffer, 0, 1);	    
            ds.send(p);
        }

        public void write(byte[] b, int off, int len) throws IOException {
            p.setData(b, off, len);
	    ds.send(p);
        }
    }

    static final int LISTEN=1, SEND=2;

    class SchemeUDPSocket extends SchemeSocket {
	protected int mode;
        protected DatagramSocket s;
        protected int packet_size;
        protected InetAddress remoteHost;
        protected int dport;

	protected void setMode(int m) {
	    mode=m;
	}

        public SchemeUDPSocket(DatagramSocket s) {
            this(s, 1500);
        }

        public SchemeUDPSocket(DatagramSocket s, String dhost) throws IOException {
            this(s, 1500);
	    remoteHost=InetAddress.getByName(dhost);
	}

        public SchemeUDPSocket(DatagramSocket s, int ps) {
            this.s=s;
            packet_size=ps;
        }

	public SchemeUDPSocket(DatagramSocket s, int port, int ds) {
	    this.packet_size=ds;
	    this.dport=port;
	    this.s=s;
	}

	public SchemeUDPSocket(DatagramSocket s, String dhost, int ds) throws IOException {
            this(s, 1500);
	    this.packet_size=ds;
	    remoteHost=InetAddress.getByName(dhost);
	}

	public SchemeUDPSocket(DatagramSocket s, int port, String dhost) throws IOException {
            this(s, 1500);
	    this.dport=port;
	    remoteHost=InetAddress.getByName(dhost);
	}

        public void display(ValueWriter w) throws IOException {
            w.append("#<").append(liMessage(SNETB, "udpsocket")).append('>');
        }

        public void close() throws IOException {
            s.close();
        }

        public SchemeInputPort getInputPort(Interpreter r) throws IOException, ContinuationException {
	    if ((mode & LISTEN)==0)
		error(r, liMessage(SNETB, "inputonoutputudp"));
            return new StreamInputPort(new BufferedInputStream(new UDPInputStream(s, packet_size)));
        }

        public SchemeOutputPort getOutputPort(Interpreter r, boolean autoflush) throws IOException, ContinuationException {
	    if ((mode & SEND)==0)
		error(r, liMessage(SNETB, "outputoninputudp"));
            return new StreamOutputPort(new UDPOutputStream(s, remoteHost, dport),
                                        autoflush);
        }
    }

    class SchemeMulticastUDPSocket extends SchemeUDPSocket {
	
        public SchemeMulticastUDPSocket(MulticastSocket s) {
            super(s);
        }

        public SchemeMulticastUDPSocket(MulticastSocket s, int ps) {
            super(s,ps);
        }

        public SchemeMulticastUDPSocket(MulticastSocket s, String host, 
					int ps) throws IOException {
            super(s, host, ps);
        }

        public SchemeMulticastUDPSocket(MulticastSocket s, int port, 
					String host) throws IOException {
					
            super(s, port, host);
        }

        public SchemeMulticastUDPSocket(MulticastSocket s, String host)
	    throws IOException {
            super(s, host);
        }

        public void display(ValueWriter w) throws IOException {
            w.append("#<").append(liMessage(SNETB, "multicastudpsocket")).append('>');
        }

        public void joinGroup(InetAddress group) throws IOException {
            ((MulticastSocket)s).joinGroup(group);
        }

        public void leaveGroup(InetAddress group) throws IOException {
            ((MulticastSocket)s).leaveGroup(group);
        }

        public void setTTL(int ttl) throws IOException {
            ((MulticastSocket)s).setTimeToLive(ttl);
        }
    }

    public SNetwork() {
        define("open-tcp-listener", OPEN_TCP_LISTENER);
        define("accept-tcp-socket", ACCEPT_TCP_SOCKET);
        define("open-tcp-socket", OPEN_TCP_SOCKET);
        define("open-socket-input-port", OPEN_SOCKET_INPUT_PORT);
        define("open-socket-output-port", OPEN_SOCKET_OUTPUT_PORT);
        define("close-socket", CLOSE_SOCKET);
        define("get-host-ip-by-name", GET_HOST_IP_BY_NAME);
        define("get-host-name-by-ip", GET_HOST_NAME_BY_IP);
        define("get-local-host", GET_LOCAL_HOST);
        define("open-udp-listen-socket", OPEN_UDP_LISTEN_SOCKET);
        define("open-udp-socket", OPEN_UDP_SOCKET);
        define("open-multicast-socket", OPEN_MULTICAST_SOCKET);
        define("join-multicast-group", JOIN_MULTICAST_GROUP);
        define("leave-multicast-group", LEAVE_MULTICAST_GROUP);
        define("set-multicast-ttl!", SET_MULTICAST_TTL);
        define("set-so-timeout!", SET_SO_TIMEOUT);
        define("socket?", SOCKETQ);
        define("server-socket?", SERVERSOCKETQ);
    }

    public static SchemeSocket sock(Value o) {
        try {
            return (SchemeSocket)o;
        } catch (ClassCastException e) { typeError(SNETB, "socket", o); }
	return null;
    }

    public static SchemeMulticastUDPSocket mcastsock(Value o) {
        try {
            return (SchemeMulticastUDPSocket)o;
        } catch (ClassCastException e) { typeError(SNETB, "multicastudpsocket", o); } 
	return null;
    }

    public static SchemeServerSocket serversock(Value o) {
        try {
            return (SchemeServerSocket)o;
        } catch (ClassCastException e) { typeError(SNETB, "tcplistensocket", o); } 
	return null;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
        try {
            switch(f.vlr.length) {
            case 0:
                switch (primid) {
                case GET_LOCAL_HOST:
                    return new SchemeString(InetAddress.getLocalHost().getHostAddress());
                default:
		    throwArgSizeException();
                }
            case 1:
                switch (primid) {
                case SOCKETQ:
                    return truth(f.vlr[0] instanceof SchemeSocket);
                case SERVERSOCKETQ:
                    return truth(f.vlr[0] instanceof SchemeServerSocket);
                case OPEN_SOCKET_INPUT_PORT:
                    SchemeSocket ss=sock(f.vlr[0]);
                    return ss.getInputPort(f);
                case OPEN_SOCKET_OUTPUT_PORT:
                    SchemeSocket ssock=sock(f.vlr[0]);
                    return ssock.getOutputPort(f, false);
                case CLOSE_SOCKET:
                    Closable c=(Closable)f.vlr[0];
                    c.close();
                    return VOID;
                case GET_HOST_NAME_BY_IP:
                    String str=string(f.vlr[0]);
                    InetAddress addr=InetAddress.getByName(str);
                    return new SchemeString(addr.getHostName());
                case GET_HOST_IP_BY_NAME:
                    str=string(f.vlr[0]);
                    addr=InetAddress.getByName(str);
                    return new SchemeString(addr.getHostAddress());
                case OPEN_TCP_LISTENER:
                    int port=num(f.vlr[0]).intValue();
                    return new SchemeServerSocket(new ServerSocket(port));
                case ACCEPT_TCP_SOCKET:
                    Socket sock=serversock(f.vlr[0]).s.accept();
                    return new SchemeTCPSocket(sock);
                case OPEN_UDP_LISTEN_SOCKET:
                    port=num(f.vlr[0]).intValue();
                    SchemeUDPSocket s=new SchemeUDPSocket(new DatagramSocket(port));
		    s.setMode(LISTEN);
		    return s;
                case OPEN_MULTICAST_SOCKET:
                    port=num(f.vlr[0]).intValue();
                    s=new SchemeMulticastUDPSocket(new MulticastSocket(port));
		    s.setMode(LISTEN);
		    return s;
                default:
		    throwArgSizeException();
                }
            case 2:
                switch (primid) {
                case OPEN_TCP_SOCKET:
                    String host=string( f.vlr[0]);
                    int port=num(f.vlr[1]).intValue();
                    return new SchemeTCPSocket(new Socket(host, port));
		case OPEN_UDP_SOCKET:
		    host=string(f.vlr[0]);
		    port=num(f.vlr[1]).intValue();
		    SchemeUDPSocket s=new SchemeUDPSocket(new DatagramSocket(), port, host);
		    s.setMode(SEND);
		    return s;
                case OPEN_UDP_LISTEN_SOCKET:
                    port=num(f.vlr[0]).intValue();
                    int ps=num(f.vlr[1]).intValue();
                    s=new SchemeUDPSocket(new DatagramSocket(port), ps);
		    s.setMode(LISTEN);
		    return s;
		case OPEN_MULTICAST_SOCKET:
		    if (f.vlr[0] instanceof SchemeString) {
			host=string(f.vlr[0]);
			int dport=num(f.vlr[1]).intValue();
			s=new SchemeMulticastUDPSocket(new MulticastSocket(dport), dport, host);
			s.setMode(SEND | LISTEN);
			return s;
		    } else if (f.vlr[1] instanceof SchemeString) {
			String iface=string(f.vlr[1]);
			port=num(f.vlr[0]).intValue();
			MulticastSocket ms=new MulticastSocket(port);
			ms.setInterface(InetAddress.getByName(iface));
			s=new SchemeMulticastUDPSocket(ms);
			s.setMode(LISTEN);
			return s;
		    } else {
			port=num(f.vlr[0]).intValue();
			ps=num(f.vlr[1]).intValue();
			s=new SchemeMulticastUDPSocket(new MulticastSocket(port), ps);
			s.setMode(LISTEN);
			return s;
		    }
                case OPEN_SOCKET_OUTPUT_PORT:
                    SchemeSocket ssock=sock(f.vlr[0]);
                    return ssock.getOutputPort(f, truth(f.vlr[1]));
                case SET_MULTICAST_TTL:
                    SchemeMulticastUDPSocket ms=mcastsock(f.vlr[0]);
                    int ttl=num(f.vlr[1]).intValue();
                    ms.setTTL(ttl);
                    return VOID;
                case JOIN_MULTICAST_GROUP:
                    ms=mcastsock(f.vlr[0]);
                    host=string( f.vlr[1]);
                    ms.joinGroup(InetAddress.getByName(host));
		    return VOID;
                case LEAVE_MULTICAST_GROUP:
                    ms=mcastsock(f.vlr[0]);
                    host=string( f.vlr[1]);
                    ms.leaveGroup(InetAddress.getByName(host));
		    return VOID;
                case SET_SO_TIMEOUT:
                    SchemeTCPSocket tcps=(SchemeTCPSocket)sock(f.vlr[0]);
                    tcps.setSoTimeout(num(f.vlr[1]).intValue());
                    return VOID;
                default:
		    throw new RuntimeException(liMessage(SISCB,"incorrectargcount"));
                }
	    case 3:
		switch(primid) {
		case OPEN_UDP_LISTEN_SOCKET:
		    int dport=num(f.vlr[0]).intValue();
		    String host=string(f.vlr[0]);
		    int ps=num(f.vlr[2]).intValue();
		    DatagramSocket ds=new DatagramSocket(dport, InetAddress.getByName(host));
		    SchemeUDPSocket s=new SchemeUDPSocket(ds, ps);
		    s.setMode(SEND | LISTEN);
		    return s;
                case OPEN_MULTICAST_SOCKET:
                    host=string(f.vlr[0]);
                    dport=num(f.vlr[1]).intValue();
		    
int dgramsize=num(f.vlr[2]).intValue();
                    s=new SchemeMulticastUDPSocket(new MulticastSocket(dport), host, dgramsize);
		    s.setMode(SEND | LISTEN);
		    return s;
		default:
		    throwArgSizeException();
		}
	    case 4:
		switch(primid) {
                case OPEN_MULTICAST_SOCKET:
                    String host=string(f.vlr[0]);
		    String iface=string(f.vlr[2]);
                    int dport=num(f.vlr[1]).intValue();
		    int dgramsize=num(f.vlr[3]).intValue();
		    MulticastSocket ms=new MulticastSocket(dport);
		    ms.setInterface(InetAddress.getByName(iface));
                    SchemeUDPSocket s=new SchemeMulticastUDPSocket(ms, host, dgramsize);
		    s.setMode(SEND | LISTEN);
		default:
		    throwArgSizeException();
		}
            default:
		throwArgSizeException();
            }
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
	return VOID;
    }
}
/*
 * The contents of this file are subject to the Mozilla Public
 * License Version 1.1 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a copy of
 * the License at http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS
 * IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * rights and limitations under the License.
 * 
 * The Original Code is the Second Interpreter of Scheme Code (SISC).
 * 
 * The Initial Developer of the Original Code is Scott G. Miller.
 * Portions created by Scott G. Miller are Copyright (C) 2000-2001
 * Scott G. Miller.  All Rights Reserved.
 * 
 * Contributor(s):
 * Matthias Radestock 
 * 
 * Alternatively, the contents of this file may be used under the
 * terms of the GNU General Public License Version 2 or later (the
 * "GPL"), in which case the provisions of the GPL are applicable 
 * instead of those above.  If you wish to allow use of your 
 * version of this file only under the terms of the GPL and not to
 * allow others to use your version of this file under the MPL,
 * indicate your decision by deleting the provisions above and
 * replace them with the notice and other provisions required by
 * the GPL.  If you do not delete the provisions above, a recipient
 * may use your version of this file under either the MPL or the
 * GPL.
 */
