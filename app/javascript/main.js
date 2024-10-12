var play_buttons = document.getElementsByClassName("quote-button");
var people_cards = document.getElementsByClassName("person-card");

for(let button of play_buttons) {
    button.onclick = (event) => {
        new Audio(event.currentTarget.dataset.audio).play(); 
    }
};

for(let person of people_cards) {
    person.onclick = (event) => {
        window.location.href = event.currentTarget.dataset.link; 
    }
}
