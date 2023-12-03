import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {

    name = "John Snow";
    age = 18;
    location = {
        city : "Winterfell",
        country : "North"
    };

    siblings = ["Robb", "Sansa", "Arya", "Bran", "Rickon"];

}