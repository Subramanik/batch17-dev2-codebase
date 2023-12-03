/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 11-07-2023
 * @last modified by  : Subramani Kumarasamy
**/
// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My Org Base URL is ' + System.Url.getSalesforceBaseUrl().toExternalForm());
System.debug('My Org Base URL is ' + URL.getOrgDomainURL().toExternalForm());

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

Boolean isLeapYear = true;
 
//Using Ternary Operator
String msg = isLeapYear ? 'It is a leap year.' : 'It is not a leap year.';
System.debug('Message - ' + msg);
if(isLeapYear){
    System.debug('It is a leap year.');
}
else{
    System.debug('It is not a leap year.');
}