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
public class GetAirlineMockCallout implements HttpCalloutMock {

    public HttpResponse respond(HttpRequest request){
        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setBody('{"id":5,"name":"Sri Lankan Airways 667","country":"Sri Lanka","logo":"https://upload.wikimedia.org/wikipedia/en/thumb/9/9b/Qatar_Airways_Logo.svg/sri_lanka.png","slogan":"From Sri Lanka","head_quaters":"Katunayake, Sri Lanka","website":"www.srilankaairways.com","established":"1990"}');
        return response;
    }

    
}