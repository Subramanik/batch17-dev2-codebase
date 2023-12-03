import { LightningElement } from 'lwc';

export default class C2pSimpleEventParent extends LightningElement {
    counter = 0;


    handleAdd(){
       this.counter++;
    }

    handleSubtract(){
        this.counter--;

    }
}