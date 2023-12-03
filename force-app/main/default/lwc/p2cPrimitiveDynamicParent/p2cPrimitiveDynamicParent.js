import { LightningElement } from 'lwc';

export default class P2cPrimitiveDynamicParent extends LightningElement {
    
    name;
    title;
    location;
    salary;
    
    changeHandler(event){
        const fieldName = event.target.name;
        
        if(fieldName === "actorName"){
            this.name = event.target.value;
        }
        if(fieldName === "actorTitle"){
            this.title = event.target.value;
        }
        if(fieldName === "location"){
            this.location = event.target.value;
        }
        if(fieldName ==="salary"){
            this.salary = event.target.value;
        }
    }
}