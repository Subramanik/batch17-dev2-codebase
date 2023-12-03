import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import ACC_NUM_FIELD from '@salesforce/schema/Account.AccountNumber';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LdsRecordEditFormAccount extends LightningElement {
    accName;
    objectApiName = ACCOUNT_OBJECT;
    recordId= "0017R00002zasyFQAQ";

    fields = {
        name: NAME_FIELD,
        phone: PHONE_FIELD,
        annualRevenue: ANNUALREVENUE_FIELD,
        industry: INDUSTRY_FIELD,
        type: TYPE_FIELD,
        accountNumber: ACC_NUM_FIELD
    };

    handleSuccess(evt){
        this.accName = evt.detail.fields.Name.value;
        console.log(evt);
        const event = new ShowToastEvent({
            title: "Success!",
            message: this.accName+ " Account is created successfully",
            variant: "success"
        })
        this.dispatchEvent(event);
    }
    handleError(evt){
        console.log(evt);
        const event = new ShowToastEvent({
            title: "Error!",
            message: "Error in creating/updating the record",
            variant: "error"
        });
        this.dispatchEvent(event);
    }
    resetHandler(){
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if(inputFields){
            inputFields.forEach(field => {
                field.value ='';
            });
        }

    }
}