/**
 * @description       : Query 100 Accounts from your Org and update their Name to be blank.
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-05-2023
 * @last modified by  : Subramani Kumarasamy
**/
global class BatchApexErrorPlatformEvent implements Database.Batchable<SObject>, Database.RaisesPlatformEvents {
    
    global Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator('SELECT Id, Name FROM Account LIMIT 100');
    }

    global void execute(Database.BatchableContext BC, List<Account> scope){
        for(Account acc: scope){
            acc.Name = NULL;
        }
        update scope;
    }

    global void finish(Database.BatchableContext BC){

    }
}