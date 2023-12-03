import { LightningElement } from 'lwc';

export default class P2cNonPrimitiveCarouselParent extends LightningElement {
    
    // Prepare the array of objects that has the carousel information
    carouselInfo = [
        {
            src : "https://images.unsplash.com/photo-1611003228941-98852ba62227?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGRvZ3xlbnwwfHwwfHx8MA%3D%3D",
            header : "Cute Dog",
            description : "My First dog",
            alternativeText : "Dog image is not available",
            href : "javascript:void(0);"
        },
        {
            src : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSajsok9MtPi_Y9zCKfFHPwN5mIJWeboid2yw&usqp=CAU",
            header : "Cute Cat",
            description : "My First Cat",
            alternativeText : "Cat image is not available",
            href : "javascript:void(0);"
        },
        {
            src : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3kq_RGMCILj_uWXV5j6CWiVKpIHF3mUT7Ow&usqp=CAU",
            header : "Cute Elephant",
            description : "My First Elephant",
            alternativeText : "Elephant image is not available",
            href : "https://en.wikipedia.org/wiki/India"
        },
        {
            src : "https://img.freepik.com/free-photo/isolated-happy-smiling-dog-white-background-portrait-4_1562-693.jpg",
            header : "Cute Dog",
            description : "My Second Dog",
            alternativeText : "Second dog image is not available",
            href : "javascript:void(0);"
        }
    ];
}