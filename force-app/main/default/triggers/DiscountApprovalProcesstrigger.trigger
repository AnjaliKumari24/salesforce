trigger DiscountApprovalProcesstrigger on Opportunity (after insert, after update) {

    ApprovalProcessCls.Discount(trigger.new);

}