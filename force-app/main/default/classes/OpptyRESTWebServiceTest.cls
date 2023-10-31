/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-30-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 * STEPS TO TEST REST APEX WEBSERVICE TESTCLASS WHICH DOES NOT HAVE ANY PARAMETERS:
 * 1. Prepare the RestRequest
 * 2. Prepare the RestContext
 * 3. Call the Method to test
 * 4. Verify the result by asserting
 */
@isTest
public class OpptyRESTWebServiceTest {

    @TestSetup
    private static void makeData(){

        Account acc = new Account();
        acc.Name ='Inbound Account';
        insert acc;

        List<Opportunity> oppList = new List<Opportunity>();
        for(Integer i=0;i<10;i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Inbound Opportunity'+i;
            opp.AccountId = acc.Id;
            opp.CloseDate = Date.newInstance(2023, 10, 30);
            opp.StageName = 'Prospecting';
            opp.Amount = 10000;
            oppList.add(opp);
        }
        insert oppList;
    }

    @isTest
    private static void getOpptyRecordByIdTest(){

        //1. Prepare the RestRequest
        RestRequest request = new RestRequest();

        Opportunity opp = [SELECT Id, CloseDate, StageName, Amount, Name FROM Opportunity LIMIT 1];
        // Prepare the EndPoint
        String baseUrl = URL.getOrgDomainURL().toExternalForm();
        String endPoint =baseUrl+'/services/apexrest/Oppty/'+opp.Id;
        System.debug('endPoint: '+endPoint);
        //Set the EndPoint
        request.requestURI = endPoint;
        request.httpMethod = 'GET';
        //2. Prepare the RestContext
        RestContext.request = request;

        //3. Call the Method to test
        Opportunity oppResult = OpptyRESTWebService.getOpptyRecordById();

        //4. Verify the result by asserting
        System.assertEquals(opp.Id, oppResult.Id, 'Id should be same');
        System.assertEquals(opp.Name, oppResult.Name, 'Name should be same');

    }

    @isTest
    private static void postOpptyDetailsTest(){

        //1. Prepare the RestRequest
        RestRequest request = new RestRequest();
        //Endpoint
        String baseUrl = Url.getOrgDomainUrl().toExternalForm();
        String endPoint = baseUrl+'/services/apexrest/Oppty';
        request.requestURI = endPoint;
        //Method
        request.httpMethod = 'POST';
        //Body
        Opportunity opp = new Opportunity(Name ='Inbound Oppty', CloseDate = Date.today(),StageName= 'Prospecting', Amount = 10000);
        String body = JSON.serialize(opp);
        Blob requestBody = Blob.valueOf(body);
        request.requestBody = requestBody;
        //2. Prepare the RestContext
        RestContext.request = request;
        //3. Call the Method to test
        String oppIdResult = OpptyRESTWebService.postOpptyDetails();

        //4. Verify the result by asserting
        System.assertNotEquals(null, oppIdResult, 'Id should not be null');
    }
    
    @isTest
    private static void PatchOpptyRecordTest(){

        //1. Prepare the RestRequest
        RestRequest request = new RestRequest();

        //EndPoint
        String baseUrl = Url.getOrgDomainUrl().toExternalForm();
        String endPoint = baseUrl+'/services/Apexrest/Oppty';
        request.requestURI= endPoint;
        //Method
        request.httpMethod = 'PATCH';
        //Body
        Opportunity opp = [SELECT Id, CloseDate, StageName, Amount, Name FROM Opportunity LIMIT 1];

        Opportunity oppInstance = new Opportunity(Id = opp.Id, Name = 'Inbound Oppty', CloseDate= Date.today(), StageName='Closed Won', Amount= 10000);

        String body = JSON.serialize(oppInstance);

        Blob requestBody = Blob.valueOf(body);
        request.requestBody = requestBody;

        //2. Prepare the RestContext
        RestContext.request = request;

        //3. Call the Method to test
        Opportunity oppResult = OpptyRESTWebService.PatchOpptyRecord();

        //4. Verify the result by asserting
        System.assertEquals(opp.Id, oppResult.Id, 'Id should be same');
        System.assertEquals('Inbound Oppty', oppResult.Name, 'Name should be same');
        System.assertEquals('Closed Won', oppResult.StageName, 'Stage should be same');

    }

    @isTest
    private static void putOpptyRecordInsertTest(){

        //PUT - Insert Testing

        //1. Call the Method
        String oppNameAndStageName = OpptyRESTWebService.putOpptyRecord(NULL, 'Inbound Put Insert', 'Prospecting', 24000, Date.newInstance(2023, 12, 12));

        //2. Verify the result by asserting

        System.assertNotEquals(null, oppNameAndStageName, 'Name and StageName shouldnot be null');
    }

    @isTest
    private static void putOpptyRecordUpdateTest(){

        //PUT - Update Testing

        //1. Call the method
        Opportunity opp = [SELECT ID FROM Opportunity LIMIT 1];
        String oppNameAndStageName = OpptyRESTWebService.putOpptyRecord(opp.Id, 'Inbound PUT Update', 'Closed Won', 460000, Date.newInstance(2024, 02, 09));

        //2. Verify the result by asserting
        System.assertNotEquals(null, oppNameAndStageName, 'Name and StageName Shouldnot be null');
    }

    @isTest
    private static void deleteOpptyRecordTest(){

        //1. Prepare the RestRequest
        RestRequest request = new RestRequest();
        //EndPoint
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];
        String baseUrl = Url.getOrgDomainUrl().toExternalForm();
        String endPoint = baseUrl+'/services/apexrest/Oppty/'+opp.Id;
        request.requestURI = endPoint;
        //Method
        request.httpMethod ='DELETE';
        //2. Prepare the RestContext
        RestContext.request = request;

        //3. Call the Method
        String result = OpptyRESTWebService.deleteOpptyRecord();

        //4. Verify the result by asserting
        System.assertEquals('Opportunity Record is Deleted Successfully', result, 'Result is not matched');
        List<Opportunity> oppList = [SELECT ID FROM Opportunity WHERE ID=:opp.Id];
        System.assertEquals(0, oppList.size(), 'Opportunity is not deleted');
    }

    @isTest
    private static void deleteOpptyRecordNegativeTest(){
        //1. Prepare the RestRequest
        RestRequest request = new RestRequest();
        //EndPoint
        Account acc = [SELECT Id FROM Account LIMIT 1];
        String baseUrl = Url.getOrgDomainUrl().toExternalForm();
        String endPoint = baseUrl+'/services/apexrest/Oppty/'+acc.Id;
        request.requestURI = endPoint;
        //Method
        request.httpMethod ='DELETE';
        //2. Prepare the RestContext
        RestContext.request = request;

        //3. Call the Method
        String result = OpptyRESTWebService.deleteOpptyRecord();

        //4. Verify the result by asserting
        System.assertNotEquals('Opportunity Record is Deleted Successfully', result, 'Result is not matched');
    }
}