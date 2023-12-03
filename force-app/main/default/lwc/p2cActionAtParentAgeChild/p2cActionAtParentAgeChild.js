import { LightningElement,api } from 'lwc';

export default class P2cActionAtParentAgeChild extends LightningElement {

    @api ageFromParent;

    get ageInMonths(){
        return this.ageFromParent * 12;
    }

    get ageInDays(){
        return this.ageFromParent * 365;
    }

}