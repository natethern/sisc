package sisc.modules;

import sisc.*;
import sisc.data.*;
import java.net.*;
import java.io.*;

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
 
 *   (open-multicast-client-socket <port> . <packet size>) => <mcast-socket>
 *   (open-multicast-server-socket <inet address> <port>) => <mcast-socket>
 *   (join-multicast-group <socket> <inet address>) => <void>
 *   (leave-multicast-group <socket> <inet address>) => <void>
 *   (set-multicast-ttl! <socket> <ttl>) => <void>
 
 *   (get-host-ip-by-name <inet address>) => <inet address>
 *   (get-host-name-by-ip <inet address>) => <inet address>
 *   (get-local-host) => <inet address>
 *
 *   (set-so-timeout <tcp socket>) => <void>
 */

public class SNetwork extends Module {
    protected static final int 
	GET_LOCAL_HOST=0, GET_HOST_NAME_BY_IP=1, GET_HOST_IP_BY_NAME=2,
	SET_MULTICAST_TTL=3, LEAVE_MULTICAST_GROUP=4, 
	JOIN_MULTICAST_GROUP=5, OPEN_MULTICAST_CLIENT_SOCKET=6, 
	OPEN_MULTICAST_SERVER_SOCKET=8, 
	OPEN_UDP_SOCKET=9, ACCEPT_TCP_SOCKET=7,
	OPEN_SOCKET_OUTPUT_PORT=10, OPEN_SOCKET_INPUT_PORT=11, 
	OPEN_TCP_SOCKET=12,
	OPEN_TCP_LISTENER=13, CLOSE_SOCKET=14,
	SET_SO_TIMEOUT=15;

    interface Closable {
	void close() throws IOException;
    }

    abstract class SchemeSocket extends Value implements Closable {
	public abstract void close() throws IOException;
	abstract InputPort getInputPort() throws IOException;
	abstract OutputPort getOutputPort() throws IOException;
    }

    class SchemeServerSocket extends Value implements Closable {
	protected ServerSocket s;

	public SchemeServerSocket(ServerSocket s) {
	    this.s=s;
	}

	public String display() {
	    return "#<tcp listen socket>";
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

	public String display() {
	    return "#<tcp socket>";
	}

	public void close() throws IOException {
	    s.close();
	}
	
	public void setSoTimeout(int ms) throws SocketException {
	    s.setSoTimeout(ms);
	}

	public InputPort getInputPort() throws IOException {
	    return new InputPort(new BufferedReader(new InputStreamReader(s.getInputStream())));
	}

	public OutputPort getOutputPort() throws IOException {
	    return new OutputPort(new PrintWriter(s.getOutputStream()));
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
	byte[] buffer=new byte[4096];

	public UDPOutputStream(DatagramSocket ds, InetAddress host, int port) {
	    this.ds=ds;
	    p=new DatagramPacket(buffer, buffer.length,
				 host, port);
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
	
    class SchemeUDPSocket extends SchemeSocket {
	protected DatagramSocket s;
	protected int packet_size;
	protected InetAddress remoteHost;
	protected int dport;
	
	public SchemeUDPSocket(DatagramSocket s) {
	    this(s, 1500);
	}

	public SchemeUDPSocket(DatagramSocket s, int ps) {
	    this.s=s;
	    packet_size=ps;
	}

	public SchemeUDPSocket(DatagramSocket s, String dhost,
			       int dport) throws IOException {
	    this(s);
	    this.remoteHost=InetAddress.getByName(dhost);
	    this.dport=dport;
	}

	public String display() {
	    return "#<udp socket>";
	}

	public void close() throws IOException {
	    s.close();
	}
	
	public InputPort getInputPort() throws IOException {
	    return new InputPort(new BufferedReader(new InputStreamReader(new UDPInputStream(s, packet_size))));
	}

	public OutputPort getOutputPort() throws IOException {
	    return new OutputPort(new PrintWriter(new UDPOutputStream(s, remoteHost, dport)));
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
					int dport) throws IOException {
	    super(s, host, dport);
	}

	public String display() {
	    return "#<multicast udp socket>";
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

    public void initialize(Interpreter r) {
	define(r, "open-tcp-listener", OPEN_TCP_LISTENER);
	define(r, "accept-tcp-socket", ACCEPT_TCP_SOCKET);
	define(r, "open-tcp-socket", OPEN_TCP_SOCKET);
	define(r, "open-socket-input-port", OPEN_SOCKET_INPUT_PORT);
	define(r, "open-socket-output-port", OPEN_SOCKET_OUTPUT_PORT);
	define(r, "close-socket", CLOSE_SOCKET);
	define(r, "get-host-ip-by-name", GET_HOST_IP_BY_NAME);
	define(r, "get-host-name-by-ip", GET_HOST_NAME_BY_IP);
	define(r, "get-local-host", GET_LOCAL_HOST);
	define(r, "open-udp-socket", OPEN_UDP_SOCKET);
	define(r, "open-multicast-client-socket", OPEN_MULTICAST_CLIENT_SOCKET);
	define(r, "open-multicast-server-socket", OPEN_MULTICAST_SERVER_SOCKET);
	define(r, "join-multicast-group", JOIN_MULTICAST_GROUP);
	define(r, "leave-multicast-group", LEAVE_MULTICAST_GROUP);
	define(r, "set-multicast-ttl!", SET_MULTICAST_TTL);
	define(r, "set-so-timeout", SET_SO_TIMEOUT);
    }

    public static SchemeSocket sock(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeSocket)o;
	} catch (ClassCastException e) { typeError(r, "socket", o); } return null;
    }

    public static SchemeMulticastUDPSocket mcastsock(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeMulticastUDPSocket)o;
	} catch (ClassCastException e) { typeError(r, "multicast udp socket", o); } return null;
    }

    public static SchemeServerSocket serversock(Interpreter r, Value o) throws ContinuationException {
	try {
	    return (SchemeServerSocket)o;
	} catch (ClassCastException e) { typeError(r, "tcp listen socket", o); } return null;
    }

    public Value eval(int primid, Interpreter f) throws ContinuationException {
	try {
	    switch(f.vlr.length) {
	    case 0:
		switch (primid) {
		case GET_LOCAL_HOST:
		    return new SchemeString(InetAddress.getLocalHost().getHostAddress());
		default:
		    error(f, "Incorrect number of arguments to procedure "+f.acc);
		}
	    case 1:
		switch (primid) {
		case OPEN_SOCKET_INPUT_PORT:
		    SchemeSocket ss=sock(f,f.vlr[0]);
		    return ss.getInputPort();
		case OPEN_SOCKET_OUTPUT_PORT:
		    SchemeSocket ssock=sock(f,f.vlr[0]);
		    return ssock.getOutputPort();
		case CLOSE_SOCKET:
		    Closable c=(Closable)f.vlr[0];
		    c.close();
		    return VOID;
		case GET_HOST_NAME_BY_IP:
		    String str=string(f,f.vlr[0]);
		    InetAddress addr=InetAddress.getByName(str);
		    return new SchemeString(addr.getHostName());
		case GET_HOST_IP_BY_NAME:
		    str=string(f,f.vlr[0]);
		    addr=InetAddress.getByName(str);
		    return new SchemeString(addr.getHostAddress());
		case OPEN_TCP_LISTENER:
		    int port=num(f,f.vlr[0]).intValue();
		    return new SchemeServerSocket(new ServerSocket(port));
		case ACCEPT_TCP_SOCKET:
		    Socket s=serversock(f,f.vlr[0]).s.accept();
		    return new SchemeTCPSocket(s);
		case OPEN_UDP_SOCKET:
		    port=num(f,f.vlr[0]).intValue();
		    return new SchemeUDPSocket(new DatagramSocket(port));
		case OPEN_MULTICAST_CLIENT_SOCKET:
		    port=num(f,f.vlr[0]).intValue();
		    return new SchemeMulticastUDPSocket(new MulticastSocket(port));
		default:
		    error(f, "Incorrect number of arguments to procedure "+f.acc);
		}
	    case 2:
		switch (primid) {
		case OPEN_TCP_SOCKET:
		    String host=string(f, f.vlr[0]);
		    int port=num(f,f.vlr[1]).intValue();
		    return new SchemeTCPSocket(new Socket(host, port));
		case OPEN_UDP_SOCKET:
		    port=num(f,f.vlr[0]).intValue();
		    int ps=num(f,f.vlr[1]).intValue();
		    return new SchemeUDPSocket(new DatagramSocket(port), ps);
		case OPEN_MULTICAST_SERVER_SOCKET:
		    host=string(f,f.vlr[0]);
		    int dport=num(f,f.vlr[1]).intValue();
		    return new SchemeMulticastUDPSocket(new MulticastSocket(), host, dport);
		case OPEN_MULTICAST_CLIENT_SOCKET:
		    port=num(f,f.vlr[0]).intValue();
		    ps=num(f,f.vlr[1]).intValue();
		    return new SchemeMulticastUDPSocket(new MulticastSocket(port), ps);
		case SET_MULTICAST_TTL:
		    SchemeMulticastUDPSocket ms=mcastsock(f,f.vlr[0]);
		    int ttl=num(f,f.vlr[1]).intValue();
		    ms.setTTL(ttl);
		    return VOID;
		case JOIN_MULTICAST_GROUP:
		    ms=mcastsock(f,f.vlr[0]);
		    host=string(f, f.vlr[1]);
		    ms.joinGroup(InetAddress.getByName(host));
		case LEAVE_MULTICAST_GROUP:
		    ms=mcastsock(f,f.vlr[0]);
		    host=string(f, f.vlr[1]);
		    ms.leaveGroup(InetAddress.getByName(host));
		case SET_SO_TIMEOUT:
		    SchemeTCPSocket tcps=(SchemeTCPSocket)sock(f,f.vlr[0]);
		    tcps.setSoTimeout(num(f,f.vlr[1]).intValue());
		    return VOID;
		default:
		    error(f, "Incorrect number of arguments to procedure "+f.acc);
		}
	    case 3:
		switch(primid) {
		case OPEN_UDP_SOCKET:
		    String host=string(f,f.vlr[0]);
		    int dport=num(f,f.vlr[1]).intValue();
		    int lport=num(f,f.vlr[2]).intValue();
		    return new SchemeUDPSocket(new DatagramSocket(lport),
					       host, dport);
		}
	    default:
		error(f, "Incorrect number of arguments to procedure "+f.acc);
	    }
	} catch (IOException e) {
	    throw new RuntimeException(e.getMessage());
	}
	return VOID;
    }
}
