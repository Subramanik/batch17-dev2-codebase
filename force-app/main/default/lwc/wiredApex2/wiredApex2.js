import { LightningElement, wire } from 'lwc';
import getAccountByIndustry from '@salesforce/apex/AccountController.getAccountByIndustry';

const COLUMNS = [
    { label: 'Account Name', fieldName: 'Name', type: 'text' },
    { label: 'Type', fieldName: 'Type', type: 'text' },
    { label: 'Industry', fieldName: 'Industry', type: 'text' },
    { label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency' },
];

export default class WiredApex2 extends LightningElement {
    accounts;
    error;
    ind= "Energy";
    columns = COLUMNS;

    //Call the wired Apex Method
    @wire(getAccountByIndustry, { industry: "$ind"})
    accountHandler({data, error}){
        if(data){
            console.log(data);
            this.accounts = data;
        }
        if(error){
            console.error(error);
            this.error = error;
        }
    }

}