
public class Main {

    public static void main(String[] args) {
        Fib fr = new FibRec();
        
        System.out.println("fib(25): " + fr.fib(25));
        System.out.println("   (calls: " + fr.getCount() + ")");

        fr.resetCount();
        System.out.println("fib(40): " + fr.fib(40));
        System.out.println("   (calls: " + fr.getCount() + ")");

        fr.resetCount();
        System.out.println("fib(45): " + fr.fib(45));
        System.out.println("   (calls: " + fr.getCount() + ")");

        fr.resetCount();
        System.out.println("fib(45): " + fr.fib(45));
        System.out.println("   (calls: " + fr.getCount() + ")");
    }

}

/*
fib(25): 75025
fib(40): 102334155
fib(45): 1134903170
*/

