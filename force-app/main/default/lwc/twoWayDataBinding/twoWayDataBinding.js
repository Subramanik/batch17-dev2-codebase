import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {

    //One way data binding --> JS --> HTML
    name = 'Batch 17 Instructor';
    age = 18;
    role = 'Admin';

    options= [
        { label: 'Admin', value: 'Admin'},
        { label: 'Developer', value: "Developer"},
        { label: 'Architect', value: 'Architect'}
    ]


    //Two way data binding - HTML --> JS
    nameChangeHandler(event){
        this.name = event.target.value;
    }

    ageChangeHandler(event){
        this.age = event.target.value;
    }

    roleChangeHandler(event){
        this.role = event.target.value;
    }
}