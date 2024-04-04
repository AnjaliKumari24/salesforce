public class Demo {
 //constructor   
    public Demo(){
        system.debug('I am Constructor');
    }
        
    public void sayHello(){
        system.debug('Hello Apex');
    }
    
    @testVisible
    private integer doSum(integer a, integer b){
    integer res=a+b;
    return res;
    
    }
    public void updateAccount(Account act){
    System.debug('Account updated successfully');
    }

}