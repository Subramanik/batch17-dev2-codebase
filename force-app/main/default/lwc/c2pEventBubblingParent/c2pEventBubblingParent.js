import { LightningElement } from 'lwc';

export default class C2pEventBubblingParent extends LightningElement {

    showHandlerCmp(){
        console.log("Parent Component: At Component Boundary");
    }

    showHandlerDiv(){
        console.log("Parent Component: At Div Boundary");
    }
}