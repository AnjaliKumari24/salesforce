trigger AccountReferenceUpdate on Contact (after insert, after update, after delete) {  
    if (Trigger.isAfter) {  
        if (Trigger.isInsert || Trigger.isUpdate) {  
            ContactReferenceTrigger.AccountReferenceUpdate(Trigger.new);  
        } else if (Trigger.isDelete) {  
           ContactReferenceTrigger.AccountReferenceUpdate(Trigger.old);  
        }  
    }  
}