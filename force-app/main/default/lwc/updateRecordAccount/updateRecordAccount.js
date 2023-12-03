import { LightningElement,wire,api } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';
import { updateRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import ANNUALREVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS= [NAME_FIELD, INDUSTRY_FIELD, ANNUALREVENUE_FIELD, WEBSITE_FIELD];

export default class UpdateRecordAccount extends LightningElement {
    industryOptions;
    @api recordId;
    account;
    inputFields ={};
    //1. Fix the dropdown value for Industry picklist field on the UI

    // Use getObjectInfo wire adapter to get the object info
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountObjInfo;

    @wire(getPicklistValues, { recordTypeId: "$accountObjInfo.data.defaultRecordTypeId", fieldApiName: INDUSTRY_FIELD })
    picklistHandler({data, error}){
        if(data){
            this.industryOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    //2. Get a specific account record from the database and display it on the UI
    @wire(getRecord, { recordId: "$recordId", fields: FIELDS })
    accountRecordHandler({data, error}){
        if(data){
            this.account = data;
        }
        if(error){
            console.error(error);
        }
    }

    // Get the field specific value

    get name(){
        return getFieldValue(this.account, NAME_FIELD);
    }

    get industry(){
        return getFieldValue(this.account, INDUSTRY_FIELD);
    }

    get annualRevenue(){
        return getFieldValue(this.account, ANNUALREVENUE_FIELD);
    }

    get website(){
        return getFieldValue(this.account, WEBSITE_FIELD);
    }

    // Allow user to modify the existing record and track the changes
    changeHandler(event){
        const fieldName = event.target.name;
        const fieldValue = event.target.value;

        //Prepare an inputFields object for the updateRecord method
        this.inputFields[fieldName]= fieldValue;
    }

    //3. Update the record in the database
    handleClick(){

        //Pass ID of the record in the fields property to update the specific record
        this.inputFields["Id"] = this.recordId;

        const recordInput = {
            fields: this.inputFields
        }
    
    
        updateRecord(recordInput)
            .then(result =>{
                this.createToastMessage("Success!!", "Record is updated successfully", "success");
            })
            .catch(error =>{
                this.createToastMessage("Error!!", error.body.message, "error");
            })
    }
    
    createToastMessage(title, msg, variant){
        const event = new ShowToastEvent({
            title: title,
            message: msg,
            variant: variant
        });
        this.dispatchEvent(event);
    }

}