import { LightningElement } from 'lwc';

export default class P2cNonPrimitiveOppParent extends LightningElement {

    //Non Primitive Data --> Array of Oppotunity Objects
    oppty = [ 
        {
            Id: "000001",
            Name: "Amazon - 100 IPhone 12 Pro Max",
            StageName: "Prospecting",
            Amount: 1000000
        },
        {
            Id: "000002",
            Name: "Amazon - 100 IPhone 12 Mini",
            StageName: "Prospecting",
            Amount: 500000
        },
        {
            Id: "000003",
            Name: "Amazon - 100 IPhone 12",
            StageName: "Prospecting",
            Amount: 750000
        },
        {
            Id: "000004",
            Name: "Amazon - 100 IPhone 12 Pro",
            StageName: "Closed Won",
            Amount: 900000
        }
    ];
}