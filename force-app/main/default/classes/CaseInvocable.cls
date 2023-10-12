/**
 * @description       : 
 * @author            : Subramani Kumarasamy
 * @group             : 
 * @last modified on  : 10-06-2023
 * @last modified by  : Subramani Kumarasamy
**/
public class CaseInvocable {

    @InvocableMethod(Label='Send Email From Apex' Description='It will send email to contact and save the email as activity' Category= 'Case')
    public static void sendEmailFromApex(List<FlowInput> inputs){

        List<Messaging.SingleEmailMessage> messageList = new List<Messaging.SingleEmailMessage>();

        for(FlowInput input : inputs){

            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            message.setSubject('CASE CREATED : '+input.caseNumber);
            message.setPlainTextBody('Hello, \n'
                                    +'A new case has been created with case number : '+input.caseNumber);
            message.setTargetObjectId(input.contactId);
            message.setSaveAsActivity(true);

            messageList.add(message);
        }
        Messaging.sendEmail(messageList);
    }

    //Wrapper Class
    public class FlowInput {
        @InvocableVariable(Label= 'Case Number' required=true)
        public String caseNumber;
        @InvocableVariable(Label= 'Contact ID' required=true)
        public Id contactId;
    }
    
}