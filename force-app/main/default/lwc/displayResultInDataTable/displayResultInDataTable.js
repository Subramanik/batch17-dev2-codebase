import { LightningElement,api } from 'lwc';

export default class DisplayResultInDataTable extends LightningElement {

    @api result;
    @api columns;
    @api error;
}