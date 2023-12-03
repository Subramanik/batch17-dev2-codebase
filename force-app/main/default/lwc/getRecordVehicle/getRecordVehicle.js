import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue, getFieldDisplayValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Vehicle__c.Name';
import TYPE_FIELD from '@salesforce/schema/Vehicle__c.Type__c';
import PRICE_FIELD from '@salesforce/schema/Vehicle__c.Price__c';
import MANUAL_TRANS_FIELD from '@salesforce/schema/Vehicle__c.Manual_Transmission__c';
import EX_COLOR_FIELD from '@salesforce/schema/Vehicle__c.Exterior_Color__c';
import DISCOUNT_FIELD from '@salesforce/schema/Vehicle__c.Discount__c';
import AFTER_DISCOUNT_FIELD from '@salesforce/schema/Vehicle__c.After_Discount__c';

const FIELDS= [NAME_FIELD, TYPE_FIELD, PRICE_FIELD, MANUAL_TRANS_FIELD, EX_COLOR_FIELD, DISCOUNT_FIELD, AFTER_DISCOUNT_FIELD];

export default class GetRecordVehicle extends LightningElement {

    recordId = "a037R00000dBTKMQA4";
    vehicleRecord;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS})
    vehicleInfo({ data, error}){
        if(data){
            console.log(data);
            this.vehicleRecord = data;
        }
        if(error){
            console.log(error);
        }
    }
    get name(){
        return getFieldValue(this.vehicleRecord, NAME_FIELD);
    }
    get type(){
        return getFieldValue(this.vehicleRecord, TYPE_FIELD);
    }
    get exteriorColor(){
        return getFieldValue(this.vehicleRecord, EX_COLOR_FIELD);
    }
    get transmissionType(){
        return getFieldValue(this.vehicleRecord, MANUAL_TRANS_FIELD);
    }
    get price(){
        return getFieldDisplayValue(this.vehicleRecord, PRICE_FIELD);
    }
    get discount(){
        return getFieldValue(this.vehicleRecord, DISCOUNT_FIELD);
    }
    get afterDiscount(){
        return getFieldDisplayValue(this.vehicleRecord, AFTER_DISCOUNT_FIELD);
    }
}