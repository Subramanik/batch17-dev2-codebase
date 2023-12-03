import { LightningElement,api } from 'lwc';

export default class P2cPrimitiveDynamicChild extends LightningElement {

    @api name;
    @api title;
    @api location;
    @api salary;
}