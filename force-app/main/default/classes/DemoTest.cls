@isTest
private class DemoTest{
@testSetup
private static void doSetup(){
Account act=new Account();
act.name='TestAccount';
insert act;
}
private static testMethod void doTest(){
demo d=new Demo();
d.sayHello();
integer res=d.doSum(10,10);
system.assertEquals(20, res, 'We are not good');
Account act=[select id, name from account where name='TestAccount'];
d.updateAccount(act);
}
}