import { LightningElement } from 'lwc';

export default class Getters extends LightningElement {

    siblings =[ "Rob", "Sansa", "Arya", "Bran", "Rickon", "Jon Snow"];

    get elderBrother(){
        return this.siblings[0];
    }

    num1 = 50;
    num2 = 78;

    sumNum = this.num1 + this.num2;

    get sumNumMethod(){
        return this.num1 + this.num2;
    }
}