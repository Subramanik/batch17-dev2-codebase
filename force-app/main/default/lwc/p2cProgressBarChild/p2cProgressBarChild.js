import { LightningElement,api } from 'lwc';

export default class P2cProgressBarChild extends LightningElement {

    @api barValueFromParent;
    @api barSizeFromParent;


    @api defaultBarSize(){
        this.barValueFromParent = 50;
    }

}