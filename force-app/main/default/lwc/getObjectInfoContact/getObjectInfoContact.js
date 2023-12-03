import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetObjectInfoContact extends LightningElement {
    defaultRTId;
    directRTId;

    @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
    objectInfoHandler({ data, error}){
        // if successful, data contains the object information
        if(data){
            this.defaultRTId = data.defaultRecordTypeId;
            console.log(data);

            // Learn How to get a specific record type Id - Direct
            //Option 1: Using for loop
            for(let rt of Object.values(data.recordTypeInfos)){
                if(rt.name === 'Direct'){
                    console.log(rt.recordTypeId);
                }
            }
            
            //Option 2: Using Object.keys
            const rtKeys = data.recordTypeInfos;
            this.directRTId = Object.keys(rtKeys).find(item => rtKeys[item].name === 'Direct');
        }
        // if error, error contains the error message
        if(error){
            console.log(error);
        }
    }
}