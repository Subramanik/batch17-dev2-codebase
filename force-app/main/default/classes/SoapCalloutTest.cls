/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-25-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 INSTRUCTIONS TO WRITE TEST CLASS FOR SOAP CALLOUT:
    1. Create a mock class that implements the WebServiceMock interface.
        a. Create a doInvoke Method with parameters.
        b. Set the dumy response.
    2. Create a test class and annotate with @isTest.
        a. Create a test method and annotate with @isTest.
        b. Use Test.setMock method to set the mock class.
        c. Call the method that makes the SOAP callout.
    3. Verify the response with assertion.
 */
@isTest
public class SoapCalloutTest {

    @isTest
    private static void ParkServiceCalloutTest(){

        //b. Use Test.setMock method to set the mock class.
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        //c. Call the method that makes the SOAP callout.
        String[] result = SoapCallout.parksCallout('India');

        //3. Verify the response with assertion.
        System.assertEquals(3, result.size(), 'Response size should be 3');
    }

    @isTest
    private static void doAddTest(){

        //b. Use Test.setMock method to set the mock class.
        Test.setMock(WebServiceMock.class, new CalculatorServicesMock());

        //c. Call the method that makes the SOAP callout.
        Double result = SoapCallout.doAddCallout(10, 10);

        //3. Verify the response with assertion.
        System.assertEquals(20, result, 'Result not matched');
    }

    @isTest
    private static void doSubtractTest(){

        //b. Use Test.setMock method to set the mock class.
        Test.setMock(WebServiceMock.class, new CalculatorServicesMock());

        //Call the Method that makes the SOAP Callout
        Double result = SoapCallout.doSubtractCallout(40, 20);

        //3. Verify the response with assertion.
        System.assertEquals(20, result, 'Result not matched');
    }

    @isTest
    private static void doMultiplyTest(){

        //b. Use Test.setMock method to set the mock class.
        Test.setMock(WebServiceMock.class, new CalculatorServicesMock());

        //Call the Method that makes the SOAP Callout
        Double result = SoapCallout.doMultiplyCallout(40, 20);

        //3. Verify the response with assertion.
        System.assertEquals(20, result, 'Result not matched');
    }

    @isTest
    private static void doDivideTest(){

        //b. Use Test.setMock method to set the mock class.
        Test.setMock(WebServiceMock.class, new CalculatorServicesMock());

        //Call the Method that makes the SOAP Callout
        Double result = SoapCallout.doDivisionCallout(40, 20);

        //3. Verify the response with assertion.
        System.assertEquals(5, result, 'Result not matched');
    }
    
}