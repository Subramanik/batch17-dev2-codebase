/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-27-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 STEPS TO WRITE APEX REST WEBSERVICE CLASS:
    1. Create an apex class and annotate it with @RestResource(urlMapping='/MyRestService/*')
    2. Create a method and annotate it with @HttpGet or @HttpPost or @HttpPut or @HttpDelete or @HttpPatch based on your requirement.
    3. Get the Request/ Process the Request
        a. RestRequest Object.
        b. Parameters
        c. Wrapper Class (Advanced Pro)
    4. Process the Business Logic as per the requirement.
    5. Return the Response.
 */
@RestResource(urlMapping='/Oppty/*')
global class OpptyRESTWebService {


    /**
     * Use Case: Allow the external system to get the Opportunity Record by passing the Opportunity Id.
     * EndPoint: https://batch17-dev2-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty/0067R00001zZ27kQAC
     * Http Method: GET
     * Return Type: Opportunity
     */
    @HttpGet
    global static Opportunity getOpptyRecordById(){

        //GET THE REQUEST
        RestRequest request = RestContext.request;

        // Learn Request Properties
        System.debug('Header :'+request.headers);
        System.debug('HTTP Method :'+request.httpMethod);
        System.debug('Params : '+request.params);
        System.debug('Remote Address :' +request.remoteAddress);
        System.debug('Request Body :'+request.requestBody);
        System.debug('Request URI :'+request.requestURI);
        System.debug('Resource Path :'+request.resourcePath);

        //Get URI
        String uri = request.requestURI;
        // '/Oppty/12121212'
        Integer index = uri.lastIndexOf('/');
        System.debug('Index :'+index);
        String opptyId = uri.substring(index+1);
        System.debug('Oppty Id :'+opptyId);

        Opportunity oppty = [SELECT Name, CloseDate, StageName, Amount FROM Opportunity WHERE Id =:opptyId];

        return oppty;
    }
    

    /**
     * Use Case: Allow the external system to create the Opportunity Record by passing the Opportunity Details.
     * EndPoint: https://batch17-dev2-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
     * Method : POST
     * Return : Opportunity ID
    */
    @HttpPost
    global static String postOpptyDetails(){

        //Get the Request Data
        RestRequest request = RestContext.request;

        // What I need from the request - Body 
        Blob requestBlob= request.requestBody;
        // Convert the Blob type to String so that JSON.deserialize can understand OR It accepts
        String requestBody = requestBlob.toString();

        Opportunity oppty = (Opportunity) JSON.deserialize(requestBody, Opportunity.class);
        // Process the business logic - create Opportunity record
        insert oppty;
        return oppty.Id;
    }

    /**
     * Use Case: Allow the external system to update the Opportunity Record by passing the Opportunity Details.
     * EndPoint: https://batch17-dev2-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
     * Method: PATCH
     * Return : Opportunity Details
    */

    @HttpPatch
    global static Opportunity PatchOpptyRecord(){

        //Get the Request Data
        RestRequest request = RestContext.request;

        // What I need from the request - Body
        String requestBody = request.requestBody.toString();

        // Deserilaize the request body
        Opportunity oppty = (Opportunity) JSON.deserialize(requestBody, Opportunity.class);

        //Process the business requirement - Update the Opportunity Record
        update oppty;

        return oppty;
    }

    /**
     * PUT = POST + PATCH
     * Use Case: Allow the External System to update and create the Opportunity Record by Passing the Opportunity Details.
     * EndPoint: https://batch17-dev2-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty
     * Method: PUT
     * Return : Opportunity Name and Stage Name // Opportunity Name Prospecting
    */

    @HttpPut
    global static String putOpptyRecord(String id, String name, String stage, Decimal opptyAmount, Date expectedCloseDate){

        // Get the Request Data - Using Parameters.
        // Deserilaize the request body - Not Required when you get the request body as a parameter.


        // Process the business Logic - Update the Opportunity Record if Id is passed else create the Opportunity Record.

        Opportunity oppty = new Opportunity();
        oppty.Id = id;
        oppty.Name = name;
        oppty.StageName = stage;
        oppty.Amount = opptyAmount;
        oppty.CloseDate = expectedCloseDate;

        upsert oppty;

        return oppty.Name + ' ' + oppty.StageName;
    }

    /**
     * Use Case: Allow the External System to delete the Opportunity Record by Passing the Opportunity Id.
     * EndPoint: https://batch17-dev2-dev-ed.develop.my.salesforce.com/services/apexrest/Oppty/OpportunityID
     * Method: DELETE
     * Return: Success or Error Message
    */

    @HttpDelete
    global static String deleteOpptyRecord(){

        // Get the Request Data
        RestRequest request = RestContext.request;

        // What I need from the Request ? - Opportunity ID from URI
        String requestUri = request.requestURI;
        // requestUri = '/Oppty/0067R00001zZ27kQAC'
        Integer index = requestUri.lastIndexOf('/');
        String opptyId = requestUri.substring(index+1);

        //Process the business Logic - Delete the Opportunity Record and return the Success or Error Message.

        try{
            Opportunity opp = [SELECT ID FROM Opportunity WHERE ID =: opptyId];
            delete opp;
            return 'Opportunity Record is Deleted Successfully';
        }
        catch(Exception ex){
            return ex.getMessage();
        }
    }
    
}