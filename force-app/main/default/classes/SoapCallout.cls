/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-24-2023
 * @last modified by  : Subramani Kumarasamy
**/
/**
 STEPS TO MAKE THE OUTBOUND SOAP API CALLOUT:
    1. Request the WSDL (Xml) File from the Destination System
    2. Generate the Apex Class from the WSDL File.
    3. Instantiate the Apex Class.
    4. Identify the right method to make the callout.
    5. Make the callout.
    6. Handle the response.
*/
public class SoapCallout {

    //Method to make callout to Park EndPoint
    public static String[] parksCallout(String country){

        //3. Instantiate the Apex Class.
        ParkServices.ParksImplPort parkService = new ParkServices.ParksImplPort();
        //4. Identify the right method to make the callout.  ==> byCountry()
        //5. Make the callout.
        String[] parks = parkService.byCountry(country);
        //6. Handle the response.
        System.debug('OutPut Parks: '+parks);

        return parks;
    }

    //Method to make callout to Calculator EndPoint to do the Addition
    public static Double doAddCallout(Double num1, Double num2){

         //3. Instantiate the Apex Class.
         CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
         //4. Identify the right method to make the callout. ===> doAdd()
         //5. Make the callout.
        Double result = calculatorService.doAdd(num1, num2);
        System.debug('Addition Result : '+result);
        return result;
    }

    //Method to make callout to Calculator EndPoint to do the Substraction
    public static Double doSubtractCallout(Double num1, Double num2){

        //3. Instantiate the Apex Class.
        CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
        //4. Identify the right method to make the callout. ==> doSubtract()
        //5. Make the callout.
        Double result = calculatorService.doSubtract(num1, num2);
        System.debug('Subtraction Result: '+result);
        return result;
    }

    //Method to make callout to Calculator EndPoint to do the multiplication
    public static Double doMultiplyCallout(Double num1, Double num2){
        //3. Instantiate the Apex Class.
        CalculatorServices.CalculatorImplPort calculatorService = new CalculatorServices.CalculatorImplPort();
        //4. Identify the right method to make the callout. ==>doMultiply()
        //5. Make the callout
        Double result = calculatorService.doMultiply(num1, num2);
        System.debug('Multiplication Result: '+result);
        return result;
    }

    //Method to make the callout to Calculator Endpoint to do the Division
    public static Double doDivisionCallout(Double num1, Double num2){

        //3. Instantiate the Apex class.
        CalculatorServices.CalculatorImplPort calculatorservice = new CalculatorServices.CalculatorImplPort();
        //4. identify the right method to make the callout. ==> doDivide()
        //5. Make the callout.
        Double result = calculatorservice.doDivide(num1, num2);
        System.debug('Division Result : '+result);
        return result;
    }
}