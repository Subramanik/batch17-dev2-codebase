/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-26-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 * STEPS FOR WRITING TEST CLASS FOR REST OUTBOUND CALLOUT:
    1. Create a mock response class that implements HttpCalloutMock interface.
        a. Should have the respond method.
        b. Set the response by calling HttpResponse class and return the response.
    2. Create a test class that has the test method and uses the Test.setMock method to specify the name of the class that implements the HttpCalloutMock interface.
        a. Call the method that makes a callout.
    3. Verify the response using Assert Statement
 */
@isTest
public class RestCalloutTest {
    
    @isTest
    private static void getAnimalTest(){

        Test.setMock(HttpCalloutMock.class, new GetAnimalMockCallout());

        // Call the method that makes a callout.
        HttpResponse response = RestCallout.getAnimal();

        //Verify the response
        System.assertEquals(200, response.getStatusCode(), 'Status code not matched');
        System.assertEquals('{"animals":["majestic badger","fluffy bunny","scary bear","chicken"]}', response.getBody(), 'Body Not matched');
    }

    @isTest
    private static void getAirlineTest(){

        Test.setMock(HttpCalloutMock.class, new GetAirlineMockCallout());

        // Call the method that makes a callout.
        HttpResponse response =RestCallout.getAirline();

        //Verify the response
        System.assertEquals(200, response.getStatusCode(), 'Status code not matched');
        System.assertEquals('OK', response.getStatus(), 'Status is not matched');

        Airline__c airline = [SELECT ID, Name FROM Airline__C];
        System.assertEquals(5, Integer.valueOf(airline.Name), 'Name is not matched');  
    }

    @isTest
    private static void getObjectTest(){
        
        Test.setMock(HttpCalloutMock.class, new GetObjectCalloutMock());

        // Call the method that makes a callout.
        HttpResponse response = RestCallout.getObjects();

        //Verify the Response
        System.assertEquals(200, response.getStatusCode(), 'Status code not matched');
        System.assertEquals('OK', response.getStatus(), 'Status not matched');
    }

    @isTest
    private static void postObjectTest(){
        
        Test.setMock(HttpCalloutMock.class, new PostObjectCalloutMock());

        // Call the method that makes a callout.
        HttpResponse response = RestCallout.postObject();

        //Verify the Response
        System.assertEquals(200, response.getStatusCode(), 'Status code not matched');
        System.assertEquals('OK', response.getStatus(), 'Status not matched');
    }

    @isTest
    private static void postAirlineTest(){

        Test.setMock(HttpCalloutMock.class, new PostAirlineCalloutMock());

        Test.startTest();
        //insert airline record with callout status as 'Callout Send'
        Airline__c airline = new Airline__c();
        airline.Name = '5';
        airline.Callout_Status__c = 'Callout Send';
        airline.Name__c= 'Test';
        airline.Established__c = '2300';
        airline.Slogan__c ='Test';
        airline.Website__c='http://www.test.com';
        airline.Logo_URL__c= 'http://www.test.com';
        airline.Country__c ='India';
        airline.Head_Quarters__c = 'New Delhi';
        insert airline;
        Test.stopTest();

        //Verify the Response
        Airline__c airlineUpdates = [SELECT ID, Callout_Status__c FROM Airline__c WHERE ID =: airline.Id];

        System.assertEquals('Callout Success', airlineUpdates.Callout_Status__c, 'Status not matched');
    }

    @isTest
    private static void deleteObjectTest(){
        
        //Set Test.setMock
        Test.setMock(HttpCalloutMock.class, new DeleteObjectCalloutMock());

        // call the method to maje callout
        HttpResponse response = RestCallout.deleteObject('121212');

        //Verify the Response with Assert Statement
        System.assertEquals(200, response.getStatusCode(), 'Status code not matched');
        System.assertEquals('OK', response.getStatus(), 'Status not matched');
    }
}