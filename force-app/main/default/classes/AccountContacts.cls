public class AccountContacts {
    Map<id,List<Contact>> con;
    public void getAllContactFromAccounts(){
        List<Account> act=[select id, name, (select id, name from Contacts) from Account];
        con=new map<id, List<Contact>>();
        for(Account a: act)
        {
            con.put(a.id, a.Contacts);
        }
        System.debug('Contacts associated with Accounts: '+con);
        System.debug('ITERATION:');
        for(String key: con.KeySet())
        {
            system.debug('Key: '+key+ 'Value: '+con.get(key));
        }
    }

}