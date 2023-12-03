import { LightningElement } from 'lwc';

export default class C2pEventWithDataParent extends LightningElement {

    nameFromChild;
    ageFromChild;

    handleInputData(event){
        console.log(JSON.stringify(event.detail));
        this.nameFromChild = event.detail.name;
        this.ageFromChild = event.detail.age;
    }
}