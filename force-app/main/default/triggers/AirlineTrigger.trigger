/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-17-2023
 * @last modified by  : Subramani Kumarasamy
**/
trigger AirlineTrigger on Airline__c (after insert) {
    if(Trigger.isAfter && Trigger.isInsert){
        for(Airline__c airline : Trigger.new){
            if(airline.Callout_Status__c == 'Callout Send'){
                //Call the callout method
                RestCallout.postAirline(airline.ID);
            }
        }
    }
}