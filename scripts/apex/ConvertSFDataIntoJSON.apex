// Get a account record from the database and conver them into JSON Data.

Account acc = [SELECT Id, Name, Phone, AnnualRevenue, NumberofEmployees FROM Account LIMIT 1];
// Convert the Account record into JSON format.
String jsonAccount = JSON.serialize(acc);
System.debug('jsonAccount: ' + jsonAccount);

String jsonAccountPretty = JSON.serializePretty(acc);
System.debug('jsonAccountPretty: ' + jsonAccountPretty);


// Get 5 Contact records from the database and convert them into JSON Data.

List<Contact> contacts = [SELECT Id, Name, Email, Phone, AccountId FROM Contact LIMIT 5];

// Convert the Contact records into JSON format.

String jsonContacts = JSON.serializePretty(contacts);
System.debug('jsonContacts: ' + jsonContacts);