/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 11-28-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class ContactController {

    @AuraEnabled
    public static List<Contact> getContacts(String searchKey){
        List<Contact> contactsToReturn = new List<Contact>();

        if(String.isNotBlank(searchKey)){
            searchKey = '%'+searchKey+'%';
            contactsToReturn = [SELECT Name, Phone, Email, Title, Department 
            FROM Contact 
            WHERE Name LIKE : searchKey];
        }
        return contactsToReturn;      
    }
    
}