import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";

export default class GetPicklistvaluesByRecordTypeAccount extends LightningElement {
    typeOptions;
    industryOptions;
    selectedType;
    selectedIndustry;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: ACCOUNT_OBJECT,
        recordTypeId: '$accountInfo.data.defaultRecordTypeId'
    })
    picklistvaluesHandler({ data, error}){
        // If successfull, then map the picklist values to the options
        if(data){
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        // If error, then show the error message in the console.
        if(error){
            console.log(error);
        }
    }

    handleChange(event){
        const field = event.target.name;
        if(field === 'type'){
            this.selectedType = event.target.value;
        }
        if(field === 'industry'){
            this.selectedIndustry = event.target.value;
        }
    }
}