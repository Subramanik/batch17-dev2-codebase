import { LightningElement } from 'lwc';

export default class ConditionalRenderingBasic extends LightningElement {

    // If true, it will show the content
    // If false, it will hide the content
    // If not defined, it will hide the content
    showContent ={
        city: 'Hyderabad',
        country: 'India',
    };

}