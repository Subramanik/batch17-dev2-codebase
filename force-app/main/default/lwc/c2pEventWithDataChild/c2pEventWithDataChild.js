import { LightningElement } from 'lwc';

export default class C2pEventWithDataChild extends LightningElement {

    userEnteredData = {};

    changeHandler(event){
        const fieldName = event.target.name;
        const fieldValue = event.target.value;

        this.userEnteredData[fieldName] = fieldValue;

        // create a CustomEvent with the data and dispatch it

        this.dispatchEvent(new CustomEvent("inputdata", {detail: this.userEnteredData}));

    }

}