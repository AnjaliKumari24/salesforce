public class SOQLCustomObj {
    
    public void getAllMerchandise(){
        List<Merchandise__c> mer=[select Merchandise_Stock__c, name from merchandise__c];
        for(Merchandise__c m: mer){
            System.debug('Merchandise Stock= ' +m.Merchandise_Stock__c+ ', Merchandise Name= '+m.name);
        }
    }

}