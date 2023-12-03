import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";

export default class GetObjectInfoAccount extends LightningElement {

    apiName;
    createable;
    defaultRTId;
    accNumdataType;
    iconUrl;

    //Syntax
    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfoHandler({data, error}){
        //if successful
        if(data){
            console.log(data);
            // Direct Access
            this.apiName = data.apiName;
            this.createable = data.createable;
            this.defaultRTId = data.defaultRecordTypeId;
            // Get value from Object of Object
            this.accNumdataType = data.fields.AccountNumber.dataType;
            this.iconUrl = data.themeInfo.iconUrl;
        }
        //if error
        if(error){
            console.log(error);
        }
    }

}
