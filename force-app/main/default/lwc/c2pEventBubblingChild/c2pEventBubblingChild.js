import { LightningElement } from 'lwc';

export default class C2pEventBubblingChild extends LightningElement {

    publishEvent(){

        // Create and dispatch the custom event
        console.log("Child Component: Before Event Dispatch");

        //create custom event
        const event = new CustomEvent("show", {
            bubbles: false,
            composed: true
        });

        // 1. Bubbles: false and Composed: false --> It is a default behaviour. Event will not bubble up and will not cross the component boundary(beyond the first level parent component boundary)

        // 2. Bubbles: true and Composed: false --> Event will bubble up and will not cross the shadow boundary(beyond the first level parent component)
        // 3. Bubbles: true and Composed: true --> Event will bubble up and will cross the shadow boundary
        // 4. Bubbles: false and Composed: true --> Not a valid combo ( it will execute the default behavior of the event)

        // Dispatch the custom event
        this.dispatchEvent(event);

        console.log("Child Component: After Event Dispatch");
    }
}