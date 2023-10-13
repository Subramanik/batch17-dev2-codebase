/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-12-2023
 * @last modified by  : Subramani Kumarasamy
**/

/** 
* STEPS TO MAKE REST OUTBOUND CALLOUT:

    1. Prepare the HttpRequest
        a. Set the endpoint
        b. Set the Method
        c. Set the Header
            i. Set the Authorization
            ii. Set the Content-Type - Only for POST, PUT, PATCH
        d. Set the Body - Only for POST, PUT, PATCH
            i. Convert SF Data into JSON
    2. Prepare the Internet http
    3. Send the request
    4. Process the response
        a. Get the status code and body
        b. Convert the JSON into SF Data
        c. Do the business logic
**/

public class RestCallout {

    //EndPoint: https://th-apex-http-callout.herokuapp.com/animals
    //Method: GET
    public static void getAnimal(){

        //1. Prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set the endpoint
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        //1.b. Set Method
        request.setMethod('GET');
        //1.c. Set Header - Not Required
        //1.d. Set Body - Not Required
        //2. Prepare the Internet http
        Http http = new Http();
        //3. Send the request
        HttpResponse response = http.send(request);
        //4. Process the response
        System.debug('Status code: '+response.getStatusCode());
        System.debug('Body: '+ response.getBody());
    }
    
}