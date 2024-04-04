import { LightningElement } from 'lwc';

export default class Parentaccount extends LightningElement {
    searchDetails=[];
    handleAccountData(event){
        alert('The event is successfully called from child');
        this.searchDetails=[];
        alert(event.detail);
        try{
            event.detail.forEach(x => {
                var accData={
                    id:x.Id,
                    name:x.Name
                }
                this.searchDetails.push(accData);
            });

        }catch(e){
           console.log(e);
        }
    }
}