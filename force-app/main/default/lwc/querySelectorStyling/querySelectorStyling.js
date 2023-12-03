import { LightningElement } from 'lwc';

export default class QuerySelectorStyling extends LightningElement {

    gotSiblings =["Arya", "Sansa", "Bran", "Jon", "Robb", "Rickon"];

    
    applyStylingMethod(){
        //Use QuerySelctor to get the HTML element and apply styling
        const h1Element = this.template.querySelector("h1");
        h1Element.style.color ="red";
        h1Element.style.fontSize ="10px";
        h1Element.style.backgroundColor = "yellow";

        const divElement = this.template.querySelector("div.childDiv");
        divElement.style.color ="blue";
        divElement.style.fontSize ="10px";
        divElement.style.backgroundColor = "white";

        const divSibling = this.template.querySelectorAll("div.sibling");
        divSibling.forEach(element =>{
            element.style.color ="green";
            element.style.border ="1px solid black";
            element.setAttribute("class", "slds-align_absolute-center");
            element.style.backgroundColor = "yellow";
        })
    }
    

}