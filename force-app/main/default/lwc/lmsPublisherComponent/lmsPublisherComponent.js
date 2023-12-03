import { LightningElement, wire } from 'lwc';

//1. Create LMS Channel.
//2. Import Message Channel and LMS API's from messageService Library
import DEMO_LMS from '@salesforce/messageChannel/DemoLMS__c';
import { MessageContext, publish} from 'lightning/messageService';
/* https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_salesforce_modules */

export default class LmsPublisherComponent extends LightningElement {
    messageToPublish;

    changeHandler(event){
        this.messageToPublish = event.target.value;
    }

    // 3. Create Message Context using Wire Service
    @wire(MessageContext)
    messageContext;

    handleClick(){

        const payLoad ={
            message : this.messageToPublish
        }

        //4. Publish the message to the LMS Channel

        publish(this.messageContext, DEMO_LMS, payLoad)
    }
}