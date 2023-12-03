import { LightningElement } from 'lwc';

export default class ConditionalRenderingAdvanced extends LightningElement {

    showContent = true;

    handleClick(){
        this.showContent = !this.showContent;
    }

}