import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ACC_NUM_FIELD from '@salesforce/schema/Account.AccountNumber';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LdsRecordFormAccount extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    recordId ='0017R00002zasyFQAQ';
    fields = [NAME_FIELD,PHONE_FIELD, ANNUALREVENUE_FIELD, INDUSTRY_FIELD, TYPE_FIELD, ACC_NUM_FIELD];

    handleSuccess(){

        const event = new ShowToastEvent({
            title: "Success",
            message: "Account is updated Successfully!!!",
            variant: "success"
        });
        this.dispatchEvent(event);
    }
}