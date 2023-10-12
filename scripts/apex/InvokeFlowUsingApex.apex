
// Query one Account record whose industry is Biotechnology
Account acc =[SELECT Id, Name, createdby.name, ownerId FROM ACCOUNT WHERE Industry = 'Biotechnology' LIMIT 1];

// Check if the Account record is not null
if(acc.Id!= NULL){
    System.debug('Account Id: '+acc.Id);
    // Prepare the parameters to the Flow.Interview
    Map<String, Object> flowParamaters = new Map<String,Object>();
    // In the above map, String is the Input Variable name on the Flow and Object is the value that we are passing to the Flow.
    flowParamaters.put('AccountId', acc.Id);
    flowParamaters.put('AccountName', acc.Name);
    flowParamaters.put('AccountOwnerId', acc.ownerId);
    flowParamaters.put('CreatedByName', acc.createdby.name);
    //Invoke the Flow
    Flow.Interview.X18_AutoLaunched_Flow_Bio_Technology_Account myFlow = new Flow.Interview.X18_AutoLaunched_Flow_Bio_Technology_Account(flowParamaters);
    myFlow.start();
}else{
    System.debug('No Bio-Tech Account Found');
}