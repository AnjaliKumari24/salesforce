import { LightningElement, track } from 'lwc';

export default class FirstCmp extends LightningElement {
   @track name="";
   @track cities=
   [
    {   Id:1,
        Name:'Bangalore',
    },
    {   Id:2,
        Name:'Delhi',
    },
    {   Id:3,
        Name:'Dimapur',
    }
   ];

    isActive=false;

    handleOnchange(event){
        this.name=event.target.value;
    }
    
    handleChange(event){
        this.isActive=event.target.checked;
    }

}