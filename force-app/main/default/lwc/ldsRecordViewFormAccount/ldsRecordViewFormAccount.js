import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACC_NUM_FIELD from '@salesforce/schema/Account.AccountNumber';

export default class LdsRecordViewFormAccount extends LightningElement {
    objectApiName = ACCOUNT_OBJECT;
    recordId ="0017R00002zasyFQAQ";

    fields = {
        name: NAME_FIELD,
        phone: PHONE_FIELD,
        annualRevenue: ANNUALREVENUE_FIELD,
        type:TYPE_FIELD,
        industry: INDUSTRY_FIELD,
        accountNumber: ACC_NUM_FIELD
    };
}