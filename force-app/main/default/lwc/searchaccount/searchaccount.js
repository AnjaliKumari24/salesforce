import { LightningElement, track } from 'lwc';
import getAccountDate from '@salesforce/apex/AccountSearchcls.findAccount'
import savelbl from '@salesforce/label/c.Save';

export default class Searchaccount extends LightningElement {
    @track accountName;
    @track accountPhone;
    @track billingStreet;
    @track billingState;
    @track billingCity;
    @track billingZipcode;
    Savelabel=savelbl;

    handleOnChangeName(event){
        if(event.target.name=='actName'){ 
            this.accountName=event.target.value;
            
        }
        else if(event.target.name=='actPhone'){
            this.accountPhone=event.target.value;
            
        }


    }
    handleOnChangeStreet(event){
        this.billingStreet=event.target.value;
        
    }
    handleOnChangeState(event){
        this.billingState=event.target.value;
        
    }
    handleOnChangeCity(event){
        this.billingCity=event.target.value;
        
    }
    handleOnChangeZipcode(event){
        this.billingZipcode=event.target.value;
        
    }
    searchAct(event){
        //alert(this.accountName);
        getAccountDate({aName:this.accountName,
                        aPhone:this.accountPhone,
                        bStreet:this.billingStreet,
                        bState:this.billingState,
                        bCity: this.billingCity,
                        bZip: this.billingZipcode}).
        then(results => {this.dispatchEvent(new CustomEvent('getaccountdata', {detail:results}))}).
        catch(error => {console.log(error)});
    }
    ResetSerachHandle(event){
        this.accountName='';
        getAccountDate({aName:''}).
        then(results => {this.dispatchEvent(new CustomEvent('getaccountdata', {detail:''}))}).
        catch(error => {console.log(error)});
    }
}