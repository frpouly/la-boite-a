var buttons = document.getElementsByClassName("quote-button")

for(let button of buttons) {
    button.onclick = (event) => {
        new Audio(event.currentTarget.dataset.audio).play(); 
    }
};