public class UpdateClosedOpportunitiesBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {    
    List<Id> failedOpportunityIds = new List<Id>();    
      
    public Database.QueryLocator start(Database.BatchableContext bc) {    
        String query = 'SELECT Id, Name, StageName FROM Opportunity'; 
            //WHERE IsClosed = true AND StageName = \'Closed Won\'';    
        return Database.getQueryLocator(query);    
    }    
      
    public void execute(Database.BatchableContext bc, List<Opportunity> scope) {    
        List<Opportunity> opportunitiesToUpdate = new List<Opportunity>();  
        System.debug(scope);
    
        for (Opportunity opp : scope) {   
            if(opp.StageName.equals('Closed Won'))
            {
                opp.Approval_Status__c = 'Approved';   
                opportunitiesToUpdate.add(opp);   
            }
            if(opp.StageName.equals('Closed Lost')){
                 failedOpportunityIds.add(opp.id); 
                 System.debug('Failed Opportunities: '+failedOpportunityIds);
            }
             
        }    
    
        try {    
            update opportunitiesToUpdate;    
        } catch (Exception e) {    
            System.debug('e');   
            }    
        }    
        
    
    public void finish(Database.BatchableContext bc) {    
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();    
          
        // Query for failed opportunities  
        List<Opportunity> failedOpportunities = [SELECT Id, Name,Owner.email FROM Opportunity WHERE Id IN :failedOpportunityIds];  
          
        for (Opportunity opp : failedOpportunities) {    
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();    
            email.setToAddresses(new List<String>{ 'anjalikumari879464@gmail.com' });    
            email.setSubject('Opportunity Update Failure');    
            email.setPlainTextBody('The update for Opportunity ' + opp.Name + ' failed. Please take appropriate action.');    
            emails.add(email);    
        }    
    
        Messaging.sendEmail(emails);    
    }    
}