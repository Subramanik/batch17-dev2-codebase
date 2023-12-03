import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordAccount extends LightningElement {

    industryOptions;
    inputData ={};

    // Get the Object Info for the Account Object to get the default RecordType Id
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountInfo;

    // Get the Industry Picklist Values for the Account Object by passing the default recordtype id and Industry field apiname
    @wire(getPicklistValues, { recordTypeId: "$accountInfo.data.defaultRecordTypeId", fieldApiName: INDUSTRY_FIELD })
    picklistValueHandler({ data, error}){
        if(data){
            console.log('Create Account Record');
            console.log(data);
            this.industryOptions = data.values;
        }
        if(error){
            console.log(error);
        }
    }

    changeHandler(event){
        //Prepare the input fields to create the record
        const fieldName = event.target.name;
        const fieldValue = event.target.value;

        //prepare an object
        this.inputData[fieldName] = fieldValue;
        console.log(JSON.stringify(this.inputData));
    }

    saveHandler(){

        // Check the User Entered Annual Revenue Value, if it is greated than 10000 then set the Rating as Hot, otherwise set the Rating as Cold. This logic needs to be implemented only when the account is created using this custom LWC screen.
        const rating = "Rating";
        if(this.inputData.AnnualRevenue > 10000){
            this.inputData[rating] = "Hot";
        }else{
            this.inputData[rating] = "Cold";
        }

        //Prepare the recordInput paramter Object
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields : this.inputData
        };
        console.log(JSON.stringify(recordInput));

        // Create the record using createRecord function
        createRecord(recordInput)
            .then(result =>{
                //If success
                console.log("success");
                this.createToastMessage("success", "Success!!!", "Account Created Successfully");
                this.resetHandler();
            })
            .catch(error =>{
                // if error
                console.error(error);
                this.createToastMessage("error", "Error!!!", "Error in creating the Account "+error.body.message);
            })
    }

    createToastMessage(variant, title, message){
        const event = new ShowToastEvent({
            variant : variant,
            title : title,
            message : message
        });
        this.dispatchEvent(event);
    }

    resetHandler(){

        // Option 1: Clear all the input fields
        //this.refs.accForm.reset();

        //Option 2: Clear all the input fields using querySelector
        this.template.querySelector('form.accountForm').reset();

        //Clear the combobox input value
        this.refs.combobox.value = '';
        this.inputData ={};
    }

}