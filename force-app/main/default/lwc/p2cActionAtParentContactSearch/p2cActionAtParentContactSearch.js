import { LightningElement } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts'

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Title', fieldName: 'Title', type: 'text' },
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Department', fieldName: 'Department', type: 'text' }
];

export default class P2cActionAtParentContactSearch extends LightningElement {

    contacts;
    error;
    columns = COLUMNS;

    changeHandler(event){
        const searchValue = event.target.value;
        if(searchValue){
            console.log(searchValue);
            //Call the apex method and retrive the contact list matching the search value
            getContacts({ searchKey: searchValue})
            .then(result =>{
                console.log(result);
                this.contacts = result;
            })
            .catch(error =>{
                this.error = error;
            })
        }else{
            this.contacts = undefined;
            this.error = 'Please enter the contact name to search';
        }
    }

}