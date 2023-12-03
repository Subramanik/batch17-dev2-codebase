import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import STAGENAME_FIELD from '@salesforce/schema/Opportunity.StageName';
import getMatchedOpportunities from '@salesforce/apex/OpportunityController.getMatchedOpportunities';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text'  },
    { label: 'Stage Name', fieldName: 'StageName', type: 'text' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' },
];

export default class ImperativeApexOpportunities extends LightningElement {
    opptyStageOptions;
    selectedStage;
    data;
    error;
    columns =COLUMNS;

    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    opptyInfo;

    @wire(getPicklistValues, { recordTypeId: "$opptyInfo.data.defaultRecordTypeId", fieldApiName: STAGENAME_FIELD })
    picklistHandler({data, error}){
        if(data){
            this.opptyStageOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    handleChange(event){
        this.selectedStage = event.target.value;

        getMatchedOpportunities({ stageName: this.selectedStage })
            .then(result =>{
                console.log(result);
                this.data = result;
            })
            .catch(error =>{
                console.error(error);
                this.error = error;
            })
    }

}