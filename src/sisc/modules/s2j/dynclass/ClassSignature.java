package sisc.modules.s2j.dynclass;

import java.lang.reflect.Modifier;

import org.objectweb.asm.ClassWriter;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;
import org.objectweb.asm.commons.GeneratorAdapter;
import org.objectweb.asm.commons.Method;


/**
 * The root of a dynamic class definition.  The ClassSignature includes a number
 * of method and constructor definitions.  It then can create the bytecode for a class
 * which has the following structure:
 * 
 *  class SomeClass extends SomeSuperClass implements SomeInterfaces {
 *  
 *     static SchemeHook[] __procs;
 *     static byte[] __bytecode;
 *     
 *     some modifiers SomeClass(... args ...) throws SomeExceptions {
 *        super(... some of the passed args ...);
 *        MethodProxy.invoke(__procs[0], this, new Object[] { ...args... });
 *     }
 *     
 *     some modifiers ReturnType someMethod(... args ...) throws SomeExceptions {
 *        return (ReturnType)MethodProxy.invoke(__procs[1], this, new Object[] {...args...});
 *     } 
 *     ...
 *  }
 * 
 * MethodProxy is then responsible for calling the SchemeHook and returning the value.
 */
public class ClassSignature implements Opcodes {

    int modifiers;
    String className;
    String superclassName;
    String[] interfaceTypes;
    ConstructorSignature[] constructors;
    MethodSignature[] methods;
    
    public ClassSignature(int modifiers, String className, String superclassName, String[] interfaceTypes,
                          ConstructorSignature[] constructors,
                          MethodSignature[] methods) {
        this.modifiers = modifiers;
        this.className = className;
        this.superclassName = superclassName;
        this.interfaceTypes = interfaceTypes;
        this.constructors=constructors;
        this.methods=methods;
    }
        
    byte[] generateBytecode() {
        ClassWriter cw=new ClassWriter(ClassWriter.COMPUTE_MAXS);
        cw.visit(V1_2, asmModifiers(modifiers), className, null, superclassName, interfaceTypes);
    
        
        cw.visitField(ACC_PRIVATE + ACC_STATIC, "__procs", "Lsisc.data.Procedure[];",
                null, null).visitEnd();
        
        cw.visitField(ACC_PUBLIC + ACC_STATIC, "__bytecode", "B[]",
                null, null).visitEnd();
        
        Type thisType=Type.getType("L"+className+";");
        Type superclassType = Type.getType(superclassName);
        
        for (int i=0; i<constructors.length; i++) {
            constructors[i].visitMethod(i, thisType, cw, superclassType);
        }
        
        for (int i=0; i<methods.length; i++) {
            methods[i].visitMethod(i+constructors.length, thisType, cw, superclassType);
        }
        cw.visitEnd();
        return cw.toByteArray();
    }
    
    static int asmModifiers(int modifiers) {
        int rv=0;
        if ((modifiers & Modifier.FINAL) > 0) 
            rv+=ACC_FINAL;
        if ((modifiers & Modifier.PRIVATE) > 0) 
            rv+=ACC_PRIVATE;
        if ((modifiers & Modifier.PROTECTED) > 0) 
            rv+=ACC_PROTECTED;
        if ((modifiers & Modifier.PUBLIC) > 0) 
            rv+=ACC_PUBLIC;
        if ((modifiers & Modifier.STATIC) > 0) 
            rv+=ACC_STATIC;
        if ((modifiers & Modifier.STRICT) > 0) 
            rv+=ACC_STRICT;
        if ((modifiers & Modifier.SYNCHRONIZED) > 0) 
            rv+=ACC_SYNCHRONIZED;
        return rv;
    }

}
