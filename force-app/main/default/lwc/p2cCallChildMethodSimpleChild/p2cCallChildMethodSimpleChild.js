import { LightningElement, api } from 'lwc';

export default class P2cCallChildMethodSimpleChild extends LightningElement {
    name;
    age;


    @api childComponentMethod(nameFromParent, ageFromParent){
        this.name = nameFromParent;
        this.age = ageFromParent;
    }

}