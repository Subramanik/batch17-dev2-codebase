import { LightningElement, wire } from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { getPicklistValues } from "lightning/uiObjectInfoApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import INDUSTRY_FIELD from "@salesforce/schema/Account.Industry";


export default class GetPicklistValuesAccountIndustry extends LightningElement {

    defaultRTId;
    industryPicklistValues;
    selectedIndustry;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    objectInfoHandler({ data, error}){
        if(data){
            this.defaultRTId = data.defaultRecordTypeId;
        }
    }

    @wire(getPicklistValues, { recordTypeId: '$defaultRTId', fieldApiName: INDUSTRY_FIELD })
    picklistHandler({ data, error}){
        if(data){
            console.log(data);
            this.industryPicklistValues = data.values;
        }
        if(error){
            console.log(error);
        }
    }

    handleChange(event){
        this.selectedIndustry = event.target.value;
    }

}