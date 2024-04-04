trigger MerchandiseBackup on Merchandise__c(before insert, after insert, before update, after update, before delete, after delete, after undelete){
if(Trigger.isAfter && Trigger.isDelete)
{
    MerchandiseBackupCls.insertMerchandiseArch(Trigger.old);
}

}