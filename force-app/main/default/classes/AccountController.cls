/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 11-21-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class AccountController {
    
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountByIndustry(String industry){
        return [SELECT Name, Type, Industry, AnnualRevenue 
                FROM Account
                WHERE Industry =: industry
                LIMIT 5];
    }
}