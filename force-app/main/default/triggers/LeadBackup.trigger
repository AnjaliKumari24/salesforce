trigger LeadBackup on Lead(before insert, after insert, before update, after update, before delete, after delete, after undelete){
if(Trigger.isAfter && Trigger.isDelete)
{
      LeadBackupCls.insertLeadArch(Trigger.old);
}
}