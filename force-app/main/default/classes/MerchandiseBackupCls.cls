public class MerchandiseBackupCls {
    public static void insertMerchandiseArch(List<Merchandise__c> mer){
       Merchandise_Arch__c ma=new Merchandise_Arch__c();
        ma.name=mer[0].name;
        insert ma;
    }

}