public class LeadBackupCls {
  
    public static void insertLeadArch(List<Lead> l){
       Lead_Arch__c la=new Lead_Arch__c();
        la.name=l[0].name;
        insert la;
    }

}