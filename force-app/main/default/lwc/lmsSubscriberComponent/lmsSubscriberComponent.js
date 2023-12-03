import { LightningElement, wire } from 'lwc';
//1. Create LMS Channel.
//2. Import Message Channel and LMS API's from messageService Library
import {
    APPLICATION_SCOPE,
    createMessageContext,
    MessageContext,
    publish,
    releaseMessageContext,
    subscribe,
    unsubscribe,
} from 'lightning/messageService';
import DEMO_LMS from '@salesforce/messageChannel/DemoLMS__c';

export default class LmsSubscriberComponent extends LightningElement {
    subscription = null;
    receivedMessage;
    subStatus = "Not Subscribed";

    //2. Create Message Context using Wire Service
    @wire(MessageContext)
    messageContext;

    subscribeHandler(){

        //3. Subscribe to the LMS Channel
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                DEMO_LMS,
                (message) => this.handleMessage(message),
                { scope: APPLICATION_SCOPE }
            );
        }
        this.subStatus = "Subscribed";
    }
    //Supporting method to get the message payload
    handleMessage(message){
        this.receivedMessage = message.message;
    }


    unSubscribeHandler(){
        this.subStatus = "Unsubscribed";
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    clearHandler(){
        this.receivedMessage = null;
    }

}