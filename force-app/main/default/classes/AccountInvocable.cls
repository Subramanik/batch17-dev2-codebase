/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-06-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class AccountInvocable {

    @InvocableMethod(Label= 'Close Related Opportunity'
    Description='This method will close all the related opportuntiy'
    Category='Account')
    public static void closeAllRelatedOppty(List<Id> accIds){
        List<Opportunity> oppListToBeUpdated = new List<Opportunity>();
        //Get all the related opportunities
        for(Opportunity opp: [SELECT Id, StageName FROM Opportunity WHERE AccountId IN: accIds]){
            opp.StageName = 'Closed Lost';
            oppListToBeUpdated.add(opp);
        }
        if(!oppListToBeUpdated.isEmpty()){
            update oppListToBeUpdated;
        }
    }  
}