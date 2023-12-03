/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 11-22-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class OpportunityController {

    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getRecentOpportunities(){
        return [SELECT Name, StageName, CloseDate, Amount 
                FROM Opportunity 
                ORDER BY CreatedDate DESC 
                LIMIT 5];
    }

    @AuraEnabled
    public static List<Opportunity> getMatchedOpportunities(String stageName){
        return [SELECT Name, StageName, CloseDate, Amount
                FROM Opportunity
                WHERE StageName =: stageName
                ORDER BY Amount DESC
                NULLS LAST];
    }
}