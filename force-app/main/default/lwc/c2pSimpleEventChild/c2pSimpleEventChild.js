import { LightningElement } from 'lwc';

export default class C2pSimpleEventChild extends LightningElement {

    addMethod(){
        // Create and dispatch custom event
        this.dispatchEvent(new CustomEvent("add"));

    }

    subtractMethod(){
        // create and dispatch custom event
        this.dispatchEvent(new CustomEvent("subtract"));
    }

}