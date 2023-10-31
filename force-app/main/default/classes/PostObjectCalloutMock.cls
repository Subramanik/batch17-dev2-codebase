/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-25-2023
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
public class PostObjectCalloutMock implements HttpCalloutMock{

    public HttpResponse respond(HttpRequest request){

        HttpResponse response = new HttpResponse();
        response.setStatusCode(200);
        response.setStatus('OK');
        response.setBody('{"id":"ff8081818b1b4123018b68231b226b1a","name":"Macbook Pro 16","createdAt":"2023-10-25T18:40:13.090+00:00","data":{"year":2023,"price":1600.0,"Hard disk size":"1 TB SSD","CPU model":"M2 Chip"}}');
        return response;
    }
    
}