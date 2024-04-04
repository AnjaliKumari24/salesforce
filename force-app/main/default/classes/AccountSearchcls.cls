public class AccountSearchcls {
    @auraEnabled(cacheable=true)
    public static List<Account> findAccount(String aName, String aPhone, String bStreet, String bState, String bCity, String bZip ){
        aName='%' + aName + '%';
        aPhone='%' +aPhone + '%';
        bStreet='%'+ bStreet +'%';
        bZip='%'+ bZip +'%';
        bState='%'+ bState +'%';
        bCity='%'+ bCity +'%';
        List<Account> act= [select id, name, phone, billingStreet, billingState, billingPostalcode, billingCity
                            from account
                            where (name like: aName)
                            OR (phone like: aPhone)
                           OR (billingStreet like: bStreet)
                           OR (billingState like: bState)
                           OR (billingCity like: bCity)
                           OR (billingPostalCode like:bZip )];
        return act;
    }

}