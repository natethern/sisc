package sisc.interpreter;

import sisc.data.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Iterator;

import sisc.util.Util;

public class StackTracer implements Cloneable {

    private static Symbol UNKNOWN = Symbol.get("?");

    private int maxDepth = 16;

    private List stack = new ArrayList();
    private List toAdd = new ArrayList();

    private boolean overflown = false;

    private static class Wrapper {

        public Expression expr;

        public Wrapper(Expression expr) {
            this.expr = expr;
        }

        public int hashCode() {
            return System.identityHashCode(expr);
        }

        public boolean equals(Object o) {
            return (o instanceof Wrapper) &&
                ((Wrapper)o).expr == expr;
        }

    }

    private static class Repetition implements Cloneable {
        public int count;
        public List exprs;

        public Repetition(int count, List exprs) {
            this.count = count;
            this.exprs = exprs;
        }

        public boolean equals(Object o) {
            if (!(o instanceof Repetition)) return false;
            Repetition rp = (Repetition)o;
            return rp.count == count && rp.exprs.equals(exprs);
        }

        public Object clone() throws CloneNotSupportedException {
            return new Repetition(count, exprs);
        }

        public Repetition copy() {
            try {
                return (Repetition)clone();
            } catch (CloneNotSupportedException e) {
                return this;
            }
        }

    }

    public StackTracer(int maxDepth) {
        this.maxDepth = maxDepth;
    }

    private static boolean addTailToPreceedingRepetition(List l) {
        /*
          (... (n x_0 ... x_m) x_0 ... x_m)
          -->
          (... (n+1 x_0 ... x_m))
        */
        int sz = l.size();
        for (int i = sz-2; i >= 0; i--) {
            Object o = l.get(i);
            if (!(o instanceof Repetition)) continue;
            Repetition rp = (Repetition)o;
            List sl = l.subList(i+1, sz);
            if (rp.exprs.equals(sl)) {
                rp.count++;
                sl.clear();
                return true;
            }
        }

        return false;
    }

    private static boolean createRepetitionFromTail(List l) {
        /*
          (... x_0 ... x_m x_0 ... x_m)
          -->
          (... (2 x_0 ... x_m))
        */
        int sz = l.size();
        for (int i = sz-1; i >= (sz+1)/2; i--) {
            List sl = l.subList(i, sz);
            if (sl.equals(l.subList(2*i-sz, i))) {
                Repetition rp = new Repetition(2, new ArrayList(sl));
                l.subList(2*i-sz, sz).clear();
                l.add(rp);
                return true;
            }
        }

        return false;
    }

    private static void compact(List l) {
        /*
          This algorithm was kindly donated by Paul Crowley
          <paul@ciphergoth.org>
        */
        while(addTailToPreceedingRepetition(l) ||
              createRepetitionFromTail(l));
    }

    private void addAll() {
        for (Iterator i = toAdd.iterator(); i.hasNext(); ) {
            Expression e = (Expression)i.next();
            stack.add(new Wrapper(e));
            compact(stack);
        }
        toAdd.clear();
    }

    public void add(Expression expr) {
        toAdd.add(expr);
        //TODO: we should look at the *deep* size of stack here
        if (toAdd.size() + stack.size() > maxDepth) {
            addAll();
            if (stack.size() > maxDepth) {
                stack.subList(0, maxDepth/2).clear();
                overflown = true;
            }
        }
    }

    public void clear() {
        stack.clear();
        toAdd.clear();
        overflown = false;
    }

    public Object clone() throws CloneNotSupportedException {
        StackTracer res = new StackTracer(maxDepth);
        res.toAdd.addAll(toAdd);
        //it's sufficient to create copies of top-level Repetitions,
        //since these are the only objects that can get modified.
        for (Iterator i = stack.iterator(); i.hasNext(); ) {
            Object o = i.next();
            res.stack.add((o instanceof Repetition) ?
                          ((Repetition)o).copy() :
                          o);
        }
        res.overflown = overflown;
        return res;
    }

    public StackTracer copy() {
        try {
            return (StackTracer)clone();
        } catch (CloneNotSupportedException e) {
            return this;
        }
    }

    private static Value deepListToValue(List l) {
        Pair res = Util.EMPTYLIST;
        for (Iterator i = l.iterator(); i.hasNext(); ) {
            Object o = i.next();
            if (o instanceof Repetition) {
                Repetition rp = (Repetition)o;
                res = new Pair(new Pair(Quantity.valueOf(rp.count),
                                        deepListToValue(rp.exprs)),
                               res);
            } else {
                res = new Pair(new ExpressionValue(((Wrapper)o).expr),
                               res);
            }

        }

        return res;
    }

    public Value toValue() {
        addAll();
        return new Pair(Util.truth(overflown), deepListToValue(stack));
    }

}
