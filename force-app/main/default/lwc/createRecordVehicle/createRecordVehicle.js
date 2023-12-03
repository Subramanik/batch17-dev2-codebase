import { LightningElement,wire } from 'lwc';
import { getObjectInfo, getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";
import { createRecord } from 'lightning/uiRecordApi';
import VEHICLE_OBJECT from "@salesforce/schema/Vehicle__c";
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CreateRecordVehicle extends LightningElement {
    typeOptions;
    exteriorColorOptions;
    inputFields = {};
    //To get defult record type id
    @wire(getObjectInfo, { objectApiName: VEHICLE_OBJECT })
    vehicleInfo;

    //get the picklist values for the record type from Vehicle Object
    @wire(getPicklistValuesByRecordType, {
        objectApiName: VEHICLE_OBJECT,
        recordTypeId: "$vehicleInfo.data.defaultRecordTypeId"
      })
    picklistHandler({data, error}){
        if(data){
            this.typeOptions = data.picklistFieldValues.Type__c.values;
            this.exteriorColorOptions = data.picklistFieldValues.Exterior_Color__c.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHandler(event){
        //Collect Field Api name and value
        const fieldApi = event.target.name;
        let fieldValue;
        if(event.target.type === "checkbox"){
            fieldValue = event.target.checked;
        }else{
            fieldValue = event.target.value;
        }

        //Prepare the Object data from user
        this.inputFields[fieldApi] = fieldValue;
        console.log(JSON.stringify(this.inputFields));
    }


    createHandler(){

        //Prepare the recordInput object
        const recordInput = {
            apiName: VEHICLE_OBJECT.objectApiName,
            fields: this.inputFields
        };

        // Call createRecord function to create the vehicle Record
        createRecord(recordInput)
            .then(result =>{
                this.createToastMessage("success", "Success!!!", "Vehicle Created Successfully");
                this.resetHandler();
            })
            .catch(error =>{
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
        this.refs.vehicleForm.reset();
        this.refs.combobox1.value ="";
        this.refs.combobox2.value ="";
        this.inputFields ={};
    }




}