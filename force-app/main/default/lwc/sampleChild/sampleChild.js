import { LightningElement, api } from 'lwc';

export default class SampleChild extends LightningElement {
    msg;
 
@api messageToDisplay(strMessage)
 
{
 
this.msg = strMessage;
}
}