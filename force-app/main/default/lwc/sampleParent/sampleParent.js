import { LightningElement } from 'lwc';

export default class SampleParent extends LightningElement {
    handleMessage (event) {
 
        this.template.querySelector('c-sample-child').messageToDisplay(event.target.value);
}
}