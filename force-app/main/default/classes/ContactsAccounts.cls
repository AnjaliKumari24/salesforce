/*public class ContactAccounts {
    
    Map<id,List<Account>> act;
    public void getAllAccountsFromContacts(){
        List<Contact> con=[select id, Account.name from Contact];
        act=new map<id, List<Account>>();
        for(Contact c: con)
        {
            act.put(c.id, c.Accounts);
        }
        System.debug('Accounts associated with Contacts: '+act);
        System.debug('ITERATION:');
        for(String key: act.KeySet())
        {
            system.debug('Key: '+key+ 'Value: '+act.get(key));
        }
    }

}
*/

public class ContactsAccounts {

    public void getAllAccountsFromContacts()

    {

        list<contact> con=[select id,name,account.name from contact];

        for(contact c: con)

        {

            system.debug(c);

        }

    }
 
}