/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 11-22-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class LeadController {

    @AuraEnabled
    public static List<Lead> getRecentLeads(){
        return [SELECT FirstName, LastName, Title, Company, Email
                FROM Lead
                ORDER BY CreatedDate DESC
                LIMIT 5];
    }
}