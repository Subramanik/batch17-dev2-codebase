/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-19-2023
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
    public static HttpResponse getAnimal(){

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
        return response;
    }
    
    //EndPoint: https://api.instantwebtools.net/v1/airlines/2
    //Method: GET
    public static HttpResponse getAirline(){

        //1. Prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set the endpoint
        //request.setEndpoint('https://api.instantwebtools.net/v1/airlines/3');
        //1.b. Set Method
        request.setMethod('GET');
        //1.c. Set Header

        //1. Bearer Token
        //request.setHeader('Authorization', 'Bearer 12344234232312');

        //2. Using Named Credentials with Username and password:
        
        request.setEndpoint('callout:Airline/5');

        //1.d. Set Body - Not Required
        //2. Prepare the Internet http
        Http http = new Http();
        //3. Send the request
        HttpResponse response = http.send(request);
        //4. Process the response
        
        if(response.getStatusCode() == 200){
            //Convert the JSON Response into SF Data
            String jsonResponse = response.getBody();
            System.debug('Response : '+jsonResponse);
            AirlineWrapper airline = (AirlineWrapper) JSON.deserialize(jsonResponse, AirlineWrapper.class);
            System.debug('Airline : '+airline);

            // Create Airline Record
            Airline__c airlineRecord = new Airline__c();
            airlineRecord.Name= String.valueOf(airline.id);
            airlineRecord.Country__c = airline.country;
            airlineRecord.Established__c = airline.established;
            airlineRecord.Head_Quarters__c = airline.head_quaters;
            airlineRecord.Logo_URL__c = airline.logo;
            airlineRecord.Name__c = airline.name;
            airlineRecord.Slogan__c = airline.slogan;
            airlineRecord.Website__c = airline.website;

            try{
                insert airlineRecord;   
            }catch(Exception ex){
                System.debug('Exception : '+ex.getMessage());
            }
        }else{
            System.debug('Status code : '+response.getStatusCode());
            System.debug('Response Body : '+response.getBody());
        }
        return response;
    }

    //EndPoint: https://api.restful-api.dev/objects
    //Method: GET
    public static HttpResponse getObjects(){

        //1. Prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set the Endpoint
        request.setEndpoint('callout:Object');
        //1.b. Set the Method
        request.setMethod('GET');
        //1.c. Set the Headers - Not Required
        //1.d. Set the Body - Not Required
        //2. Prepare the Internet http
        Http http = new Http();
        //3. Send the Request.
        HttpResponse response = http.send(request);
        //4. Process the Response
        System.debug('Status Code : '+response.getStatusCode());
        System.debug('Response Body : '+ response.getBody());
        return response;
    }

    //EndPoint : https://api.restful-api.dev/objects
    // Method : POST
    public static HttpResponse postObject(){

        //1. Prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set the EndPoint
        request.setEndpoint('callout:Object');
        //1.b. Set the Method
        request.setMethod('POST');
        //1.c Set the Headers
        request.setHeader('Content-Type', 'application/json');
        
        //1.d. Set the Body

        // i. Prepare the Body
        ObjectRequest objReq = new ObjectRequest();
        objReq.name = 'Macbook Pro 16';

        ObjectRequest.DataWrapper dataWrapper = new ObjectRequest.DataWrapper();
        dataWrapper.year = 2023;
        dataWrapper.price= 1600.00;
        dataWrapper.CPU_model= 'M2 Chip';
        dataWrapper.Hard_disk_size = '1 TB SSD';

        objReq.data =dataWrapper;

        String jsonBody = JSON.serialize(objReq);
        jsonBody = jsonBody.replaceAll('"Hard_disk_size"', '"Hard disk size"');
        jsonBody = jsonBody.replaceAll('"CPU_model"', '"CPU model"');
        System.debug(jsonBody);

        request.setBody(jsonBody);

        //2. Prepare the Internet http

        Http http = new Http();

        // 3. Send the Request
        HttpResponse response = http.send(request);

        //4. Process the Response
        System.debug('Status Code : '+response.getStatusCode());
        System.debug('Status : '+response.getStatus());
        System.debug('Response Body : '+response.getBody());

        if(response.getStatusCode() == 200){
            // Convert JSON into SF Data
            String jsonResponse = response.getBody();
            jsonResponse = jsonResponse.replaceAll('"Hard disk size"','"Hard_disk_size"');
            jsonResponse = jsonResponse.replaceAll('"CPU model"', '"CPU_model"');
            System.debug('Response : '+jsonResponse);
            ObjectResponse objResponse = (ObjectResponse) JSON.deserialize(jsonResponse, ObjectResponse.class);

            System.debug('Name : '+objResponse.name);
            System.debug('Id : '+objResponse.id);
            System.debug('createdAt : '+objResponse.createdAt);
            System.debug('CPU Model : '+objResponse.data.CPU_model);
            System.debug('Hard Disk size : '+objResponse.data.Hard_disk_size);
            System.debug('Price : '+objResponse.data.price);
            System.debug('Year : '+objResponse.data.year);

        }
        return response;
    }

    //EndPoint: https://api.instantwebtools.net/v1/airlines
    //Method: POST
    @future(callout=true)
    public static void postAirline(ID airlineId){

        //1. prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. Set the EndPoint
        request.setEndpoint('callout:Airline');
        //1.b. Set the Method
        request.setMethod('POST');
        //1.c Set the Headers
        //i. Set the Content-Type
        request.setHeader('Content-Type', 'application/json');
        //1.d. Set the Body
        //i. prepare the Body
            // Query the Airline Record and prepare the JSON Body
        Airline__c airlineRecord = [SELECT ID, Name, Callout_Status__c, Country__c, Established__c, Head_Quarters__c, Logo_URL__c, Name__c, Slogan__c, Website__c FROM Airline__c WHERE ID =: airlineId];

        // Map the Airline Record into Airline Wrapper
        AirlineWrapper airlineWrapper = new AirlineWrapper();
        airlineWrapper.id = Integer.valueOf(airlineRecord.Name);
        airlineWrapper.country = airlineRecord.Country__c;
        airlineWrapper.established = airlineRecord.Established__c;
        airlineWrapper.logo = airlineRecord.Logo_URL__c;
        airlineWrapper.name = airlineRecord.Name__c;
        airlineWrapper.head_quaters = airlineRecord.Head_Quarters__c;
        airlineWrapper.website = airlineRecord.Website__c;
        airlineWrapper.slogan = airlineRecord.Slogan__c;

        // Convert the Airline Wrapper into JSON
        String jsonBody = JSON.serialize(airlineWrapper);
        System.debug('JSON Body : '+jsonBody);

        // Set the Body
        request.setBody(jsonBody);

        //2. Prepare the Internet http
        Http http = new Http();

        //3. Send the Request
        HttpResponse reponse = http.send(request);

        //4. Process the Response
        System.debug('Status Code : '+reponse.getStatusCode());
        // Do the business logic based on the response
        if(reponse.getStatusCode() == 200){
            System.debug('Callout is successfull');
            System.debug('Response Body : '+reponse.getBody());
            // Update Airline Record Callout Status as Callout Success
            airlineRecord.Callout_Status__c = 'Callout Success';
        }else{
            System.debug('Callout is Failed');
            System.debug('Response Body : '+reponse.getBody());
            // Update Airline Record Callout Status as Callout Failed
            airlineRecord.Callout_Status__c = 'Callout Failed';
        }
        update airlineRecord;
    }
    
    //EndPoint:https://api.restful-api.dev/objects/ID
    //Method: DELETE
    public static HttpResponse deleteObject(String id){
        
        //1. Prepare the HttpRequest
        HttpRequest request = new HttpRequest();
        //1.a. set EndPoint
        request.setEndpoint('callout:Object/'+id);
        //1.b. Set Method
        request.setMethod('DELETE');
        //2. Prepare the Internet http
        Http http = new Http();
        //3. Send the Request
        HttpResponse response = http.send(request);
        //4. Process the Response
        System.debug('Status Code : '+ response.getStatusCode());
        System.debug('Response Body : '+ response.getBody());
        return response;
    }
    
}