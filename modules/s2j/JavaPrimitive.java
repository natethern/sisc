package sisc.modules.s2j;

import java.io.IOException;

import sisc.ser.Serializer;
import sisc.ser.Deserializer;

public class JavaPrimitive extends JavaObject {

    protected Class type;

    public byte getObjType() {
        return JOBJ;
    }

    public JavaPrimitive() {}

    public void serialize(Serializer s) throws IOException {
        s.writeUTF(Util.nameType(type));
        s.writeObject(obj);
    }

    public void deserialize(Deserializer s) throws IOException {
        type = Util.resolveType(s.readUTF());
        try {
            obj = s.readObject();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(liMessage(Util.S2JB, "cannotdeserialize"));
        }
    }

    public JavaPrimitive(Class type, Object obj) {
        this.type = type;
        this.obj = obj;
    }

    public Class classOf() {
        return type;
    }

    public String display() {
        StringBuffer b=new StringBuffer();
        b.append("#<java ");
        b.append(Util.nameType(type));
        b.append(" ");
        b.append(obj);
        b.append('>');
        return b.toString();
    }

    public boolean eq(Object v) {
        return this == v || (v != null && v.getClass() == JavaPrimitive.class
                             && type == ((JavaPrimitive)v).type
                             && obj.equals(((JavaPrimitive)v).obj));
    }

}
