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

export default class LdsRecordEditFormVehicle extends LightningElement {
    objectApiName = VEHICLE_OBJECT;
    recordId= "a037R00000dBTKMQA4";

    fields ={
        name: NAME_FIELD,
        type: TYPE_FIELD,
        price: PRICE_FIELD,
        manualTransmission: MANUAL_TRANS_FIELD,
        exteriorColor: EX_COLOR_FIELD,
        discount: DISCOUNT_FIELD,
        afterDiscount: AFTER_DISCOUNT_FIELD,
        owner: OWNER_FIELD
    };

    handleSuccess(){
        this.createToastMessage("Success!!!", "Record is saved successfully", "success");
    }

    handleError(){
        this.createToastMessage("Error!!!!", "Record is not saved successfully", "error");
    }

    createToastMessage(title, messsage, variant){
        const event = new ShowToastEvent({
            title: title,
            message: messsage,
            variant: variant
        });
        this.dispatchEvent(event);
    }
}