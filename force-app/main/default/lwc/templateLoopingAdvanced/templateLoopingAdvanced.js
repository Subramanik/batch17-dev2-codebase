import { LightningElement } from 'lwc';

export default class TemplateLoopingAdvanced extends LightningElement {

    contactList = [
        {
            Id : 1,
            Name : "Jon Snow",
            Title: "King of the North"
        },
        {
            Id: 2,
            Name : "Daenerys Targaryen",
            Title: "Mother of Dragons"
        },
        {
            Id: 3,
            Name : "Tyrion Lannister",
            Title: "Hand of the Queen"
        },
        {
            Id: 4,
            Name : "Arya Stark",
            Title: "No one"
        },
        {
            Id: 5,
            Name : "Sansa Stark",
            Title: "Lady of Winterfell"
        }
    ];
}