public class ExceptionDemo {
    public void getDivide(integer a, integer b){
        try{
            integer res=a/b;
            System.debug('Result= '+res);
            
            List<String>name=new list<String>();
            System.debug(name.get(2));
            
            //correct
            //Demo d=new Demo();
            
            //Incorrect
            Demo d;
            System.debug('Value of d= '+d);
            d.sayHello();
            
            
            
        }catch(MathException me){
            System.debug('You cant divide a number by zero');
        }catch(NullPointerException npe){
            System.debug('You cannot call a method with null');
        }catch(Exception e){
            System.debug('There is logical error in the code');
        }finally{
            System.debug('I am finally block and I execute despite of exception');
        }
    }

}