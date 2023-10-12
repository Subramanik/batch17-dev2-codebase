//1. Publish Chatter notification using Platform Event - Notification__e

Notification__e notifyEvent = new Notification__e();
notifyEvent.Message__c = 'Hey, this is a message coming from 3rd party system';
notifyEvent.Process__c = 'Process-123';
EventBus.publish(notifyEvent);


//2. Execute Error Batch to create Application Log:
BatchApexErrorPlatformEvent batchError = new BatchApexErrorPlatformEvent();
Database.executeBatch(batchError);