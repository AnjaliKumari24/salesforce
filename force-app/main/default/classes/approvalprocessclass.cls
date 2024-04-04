public class approvalprocessclass {  
    public static void applyDiscount(Opportunity opp) { 
       
        Decimal discountAmount=opp.discount_amount__c;
        try{
        if (discountAmount > 1000000) {  
  
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();     // Trigger approval process
            req.setObjectId(opp.Id);  //sending result for approval
            Approval.ProcessResult result = Approval.process(req);  //storing result
              
            if (result.isSuccess()) {  
                System.debug('Approval process started successfully.');  
            } else {  
                System.debug('Approval process failed to start: ' + result.getErrors()[0].getMessage());  
            }  
        } else {  
            // Apply discount directly  
            opp.Discount_amount__c = discountAmount;  
            update opp;  
            System.debug('Discount applied directly to the Opportunity.');  
        }  
        }
        catch(Exception error){
            system.debug('error occurred :'+error);
        }
   
    }
}