public class SOQLDemo {
    public void getAllAccount(){
        List<Account> act=[select id, name from account];
        for(Account a: act){
            System.debug('Account Id= ' +a.id+ '     , Account Name= '+a.name);
        }
    }

}