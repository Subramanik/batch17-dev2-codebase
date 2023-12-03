import { LightningElement } from 'lwc';

export default class P2cProgressBarParent extends LightningElement {
    userEnteredValue;
    userSelectedOption;

    get sizeOptions() {
        return [
            { label: 'Small', value: 'small' },
            { label: 'Medium', value: 'medium' },
            { label: 'Large', value: 'large' },
        ];
    }


    changeHandler(event){
        const fieldDifferentiator = event.target.name;
        
        if(fieldDifferentiator === "barValue"){
            this.userEnteredValue = event.target.value;
        }
        if(fieldDifferentiator === "barSize"){
            this.userSelectedOption = event.target.value;
        }

    }

    resetHandler(){
        const childComponent = this.template.querySelector("c-p2c-progress-bar-child");
        childComponent.defaultBarSize();
    }
}