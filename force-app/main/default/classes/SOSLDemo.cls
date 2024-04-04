public class SOSLDemo {
    public void searchText(){
        List<List<sObject>> searchedResult=[find 'PWC' in name fields returning Contact(firstName), Account(name)];
        List<Contact> con= searchedResult[0];
        List<Account> act=searchedResult[1];
        if(con.size()>0)
        {
            for(Contact c:con)
            {
                System.debug(c);
            }
        }
        else{
            System.debug('No Record found in Contact Object');
            
        }
        if(act.size()>0)
        {
            for(Account a:act)
            {
                System.debug('Account Id= '+a.id+ 'Account Name= '+a.name);
            }
        }
        else{
            System.debug('No Record found Account Object');
            
        }
        
    }

}