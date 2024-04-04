public class ContactReferenceTrigger {
    public static void AccountReferenceUpdate(List<Contact> contacts){
        Set<Id> accountIds = new Set<Id>();  
        //List<Contact> con=[select id, Account.name from Contact];
          
        // Collect all the Account Ids related to the Contacts  
        for (Contact c : contacts) {  
            accountIds.add(c.AccountId);  
        } 
        system.debug(accountIds);
        
        // Query all the related Contacts for each Account  
        List<Contact> conIds=[SELECT Id, AccountId, Reference__c FROM Contact WHERE AccountId IN :AccountIds];
        Map<Id, Boolean> accountReferenceMap = new Map<Id, Boolean>();  
        for (Contact c : conIds) {  
            if (!accountReferenceMap.containsKey(c.AccountId)) {  
                accountReferenceMap.put(c.AccountId, false);  
            }  
              
            if (c.Reference__c) {  
                accountReferenceMap.put(c.AccountId, true);  
            }  
        }
        System.debug(accountReferenceMap);
        // Update the Reference__c field on the parent Account based on the Contacts' Reference__c values  
        List<Account> accountsToUpdate = new List<Account>();  
        for (Id accountId : accountReferenceMap.keySet()) {  
            accountsToUpdate.add(new Account(Id = accountId, Reference__c = accountReferenceMap.get(accountId)));  
        }  
        
        // Perform the update operation  
        if (!accountsToUpdate.isEmpty()) {  
            try {  
                update accountsToUpdate;  
            } catch (Exception referenceError) {  
                System.debug('An error occurred while updating the Accounts: ' + referenceError.getMessage());  
            }  
        }
        System.debug(accountsToUpdate);
}
}