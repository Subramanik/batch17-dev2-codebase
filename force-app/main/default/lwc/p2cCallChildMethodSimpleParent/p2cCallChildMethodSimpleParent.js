import { LightningElement } from 'lwc';

export default class P2cCallChildMethodSimpleParent extends LightningElement {

    userEnteredName;
    userEnteredAge;


    changeHandler(event){
        const nameDifferentiator = event.target.name;

        if(nameDifferentiator === "name"){
            this.userEnteredName = event.target.value;
        }
        if(nameDifferentiator === "age"){
            this.userEnteredAge = event.target.value;
        }
    }

    callChildMethod(){

        // Call the child method which is on the Child component to pass the user entered values
        const childComponent = this.template.querySelector("c-p2c-call-child-method-simple-child");
        childComponent.childComponentMethod(this.userEnteredName, this.userEnteredAge);
    }

}