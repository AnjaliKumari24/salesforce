public class ApprovalProcessCls {
    public static void Discount(List<Opportunity> opp){
        for(Opportunity o: opp){
          if(o.Discount_Amount__c>1000000){
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();     // Trigger approval process
            req.setObjectId(o.Id);  //sending result for approval
            Approval.ProcessResult result = Approval.process(req);  //storing result
            if (result.isSuccess()) {  
                System.debug('Approval process started successfully.');  
            } else {  
                System.debug('Approval process failed to start: ' + result.getErrors()[0].getMessage());  
            }  
        }  
        }
        
    }

}