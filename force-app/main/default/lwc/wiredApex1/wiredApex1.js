import { LightningElement,wire } from 'lwc';
import getRecentOpportunities from '@salesforce/apex/OpportunityController.getRecentOpportunities';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Stage Name', fieldName: 'StageName', type: 'text' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
];

export default class WiredApex1 extends LightningElement {

    opps;
    error;
    columns = COLUMNS;
    // Call the Apex Method using @Wire
    @wire(getRecentOpportunities)
    opportunityResult({data, error}){
        if(data){
            console.log(data);
            this.opps = data;
        }
        if(error){
            console.error(error);
            this.error = error;
        }
    }
}   