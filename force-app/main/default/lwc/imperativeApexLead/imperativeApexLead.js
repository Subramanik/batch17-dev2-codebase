import { LightningElement } from 'lwc';
import getRecentLeads from '@salesforce/apex/LeadController.getRecentLeads';

export default class ImperativeApexLead extends LightningElement {
    leads;
    error;

    fetchLeads(){
        getRecentLeads()
            .then(result => {
                console.log(result);
                this.leads = result;
            })
            .catch(error =>{
                console.log(error);
                this.error = error;
            })
    }
}