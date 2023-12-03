import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue, getFieldDisplayValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, ANNUALREVENUE_FIELD, PHONE_FIELD,WEBSITE_FIELD];

export default class GetRecordAccount extends LightningElement {

    recordId = "0017R00002zasyFQAQ";
    account;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS})
    accountInfo({ data, error}){
        if(data){
            console.log('I am here in getRecord Component');
            console.log(data);
            this.account = data;
        }
        if(error){
            console.log(error);
        }
    }

    get name(){
        return getFieldValue(this.account, NAME_FIELD);
    }

    get type(){
        return getFieldValue(this.account, TYPE_FIELD);
    }
    get industry(){
        return getFieldValue(this.account, INDUSTRY_FIELD);
    }
    get annualRevenue(){
        return getFieldDisplayValue(this.account, ANNUALREVENUE_FIELD);
    }
    get phone(){
        return getFieldValue(this.account, PHONE_FIELD);
    }
    get website(){
        return getFieldValue(this.account, WEBSITE_FIELD);
    }
}