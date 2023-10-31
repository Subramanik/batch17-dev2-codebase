/**
 STEPS TO MAKE THE OUTBOUND SOAP API CALLOUT:
    1. Request the WSDL (Xml) File from the Destination System
    2. Generate the Apex Class from the WSDL File.
    3. Instantiate the Apex Class.
    4. Identify the right method to make the callout.
    5. Make the callout.
    6. Handle the response.
*/

// 1. Park Callout - SOAP API
SoapCallout.parksCallout('India');

SoapCallout.parksCallout('USA');

// 2. Calcualtor Callout - SOAP API
//Addition
SoapCallout.doAddCallout(97, 34);

//Subtraction
SoapCallout.doSubtractCallout(60, 20);

//Multiplication
SoapCallout.doMultiplyCallout(45, 45);

//Division
SoapCallout.doDivisionCallout(900, 5);


RestCallout.postObject();