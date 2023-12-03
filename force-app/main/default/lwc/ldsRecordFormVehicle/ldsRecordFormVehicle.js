import { LightningElement } from 'lwc';
import VEHICLE_OBJECT from '@salesforce/schema/Vehicle__c';
import NAME_FIELD from '@salesforce/schema/Vehicle__c.Name';
import TYPE_FIELD from '@salesforce/schema/Vehicle__c.Type__c';
import PRICE_FIELD from '@salesforce/schema/Vehicle__c.Price__c';
import MANUAL_TRANS_FIELD from '@salesforce/schema/Vehicle__c.Manual_Transmission__c';
import EX_COLOR_FIELD from '@salesforce/schema/Vehicle__c.Exterior_Color__c';
import DISCOUNT_FIELD from '@salesforce/schema/Vehicle__c.Discount__c';
import AFTER_DISCOUNT_FIELD from '@salesforce/schema/Vehicle__c.After_Discount__c';
import OWNER_FIELD from '@salesforce/schema/Vehicle__c.OwnerId';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class LdsRecordFormVehicle extends LightningElement {
    objectApiName =VEHICLE_OBJECT;
    recordId= "a037R00000dBTKMQA4";
    fields = [NAME_FIELD,TYPE_FIELD, PRICE_FIELD, MANUAL_TRANS_FIELD, EX_COLOR_FIELD, DISCOUNT_FIELD,AFTER_DISCOUNT_FIELD, OWNER_FIELD];

    handleSuccess(){
        const event = new ShowToastEvent({
            title : 'Success',
            message : 'Vehicle Record created/edited successfully',
            variant :'success'
        });
        this.dispatchEvent(event);
    }
}