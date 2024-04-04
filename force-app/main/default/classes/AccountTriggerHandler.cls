public class AccountTriggerHandler {  
    public static void updateAccountReference(List<Contact> contacts) {  
        Set<Id> accountIds = new Set<Id>();  
          
        // Collect all the Account Ids related to the Contacts  
        for (Contact contact : contacts) {  
            accountIds.add(contact.AccountId);  
        }  
        
          
        // Query all the related Contacts for each Account  
        Map<Id, Boolean> accountReferenceMap = new Map<Id, Boolean>();
        
        for (Contact contact : [SELECT Id, AccountId, Reference__c FROM Contact WHERE AccountId IN :accountIds]) {  
            if (!accountReferenceMap.containsKey(contact.AccountId)) {  
                accountReferenceMap.put(contact.AccountId, false);  
            }  
              
            if (contact.Reference__c) {  
                accountReferenceMap.put(contact.AccountId, true);  
            }  
        }  
          
        // Update the Reference__c field on the parent Account based on the Contacts' Reference__c values  
        List<Account> accountsToUpdate = new List<Account>();  
        for (Id accountId : accountReferenceMap.keySet()) {  
            accountsToUpdate.add(new Account(Id = accountId, Reference__c = accountReferenceMap.get(accountId)));  
        }  
          
        // Perform the update operation  
        if (!accountsToUpdate.isEmpty()) {  
            try {  
                update accountsToUpdate;  
            } catch (Exception e) {  
                System.debug('An error occurred while updating the Accounts: ' + e.getMessage());  
            }  
        }  
    }  
}