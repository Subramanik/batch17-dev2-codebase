//Convert JSON Account data into Salesforce Data

String jsonAccount ='{"attributes":{"type":"Account","url":"/services/data/v58.0/sobjects/Account/0017R00002zfiwSQAQ"},"Id":"0017R00002zfiwSQAQ","Name":"Batch17 Master Account"}';

// Convert JSON to Apex

Account acc = (Account) JSON.deserialize(jsonAccount, Account.class);

System.debug('Name: '+ acc.Name);
System.debug('ID: '+ acc.Id);


