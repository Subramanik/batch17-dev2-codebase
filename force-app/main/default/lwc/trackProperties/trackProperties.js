import { LightningElement, track } from 'lwc';

export default class TrackProperties extends LightningElement {

   //object
   @track
   location = {
        city: "Westros",
        country : "North"
   }

   //array
   @track
   siblings = ["Arya", "Sansa", "Robb", "Bran", "Rickon"];

   changeHandler(event){
        this.location.city = event.target.value;
   }

   handleClick(){
     this.siblings.push("Jon Snow");
   }
}