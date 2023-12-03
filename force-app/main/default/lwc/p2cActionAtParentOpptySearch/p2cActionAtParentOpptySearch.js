import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import OPPORTUNITY_OBJECT from "@salesforce/schema/Opportunity";
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import getMatchedOpportunities from '@salesforce/apex/OpportunityController.getMatchedOpportunities';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Stage Name', fieldName: 'StageName', type: 'text' },
    { label: 'Close Date', fieldName: 'CloseDate', type: 'date' },
    { label: 'Amount', fieldName: 'Amount', type: 'currency' }
];


export default class P2cActionAtParentOpptySearch extends LightningElement {
    stageOptions;
    selectedStage;
    opportunities;
    error;
    columns = COLUMNS;

    //GET THE DEFAULT RECORDTYPEID OF OPPORTUNITY OBJECT
    @wire(getObjectInfo, { objectApiName: OPPORTUNITY_OBJECT })
    opptyInfo;


    //Get Opportunity Stage Picklist Values
    @wire(getPicklistValues, { recordTypeId: "$opptyInfo.data.defaultRecordTypeId", fieldApiName: STAGE_FIELD })
    picklistHandler({ data, error}){
        if(data){
            this.stageOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHandler(event){
        this.selectedStage = event.target.value;

        //Call Apex method to get matched opportunities
        getMatchedOpportunities({stageName : this.selectedStage})
        .then(result =>{
            this.opportunities = result;
        })
        .catch(error =>{
            this.error = error;
        })
    
        
    }
}