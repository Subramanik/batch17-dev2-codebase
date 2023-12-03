import { LightningElement } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DeleteRecordFunction extends LightningElement {

    recordId;

    // Capture the user entered record id from the input field
    changeHandler(event){
        this.recordId = event.target.value;
    }

    // delete the record using deleteRecord Function
    handleClick(){

        deleteRecord(this.recordId)
            .then(result =>{
                this.createToastMessage("Success!!!", "Record is deleted Successfully", "success");
                this.refs.inputComp.value =''; // clear the input field
            })
            .catch(error =>{
                this.createToastMessage("Error!!!", error.body.message, "error");
            })
    }

    createToastMessage(title, msg, variant){
        const toastEvent = new ShowToastEvent({
            title: title,
            message: msg,
            variant: variant
        });
        this.dispatchEvent(toastEvent);
    }

}