trigger approvalprocesstrigger on Opportunity (after insert) {
    for(opportunity o:trigger.new)
    approvalprocessclass.applyDiscount(o);
    

}