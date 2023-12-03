import { LightningElement, api } from 'lwc';

export default class P2cPrimitiveStaticChild extends LightningElement {

    // Child component needs to retrive the data/information from the parent component and display the retrived data on the UI

    @api actorName;
    @api actorTitle;
    @api actorLocation;
    @api actorSalary;


}