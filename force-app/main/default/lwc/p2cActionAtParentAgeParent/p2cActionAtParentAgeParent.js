import { LightningElement } from 'lwc';

export default class P2cActionAtParentAgeParent extends LightningElement {
    UserEnteredAge=0;

    changeHandler(event){
        this.UserEnteredAge = event.target.value;
    }
}