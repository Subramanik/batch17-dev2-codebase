import { LightningElement } from 'lwc';

export default class C2pEventBubblingGrandParent extends LightningElement {

    showHandlerCmp(){
        console.log("Grand Parent Component: At Component Boundary");
    }

    showHandlerDiv(){
        console.log("Grand Parent Component: At Div Boundary");
    }

    showHandlerNoRelationDiv(){
        console.log("Grand Parent Component: At Div Boundary with No Relation");
    }
}