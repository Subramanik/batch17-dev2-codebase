/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-19-2023
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
}