var play_buttons = document.getElementsByClassName("quote-button");
var people_cards = document.getElementsByClassName("person-card");

function hide_all_share_buttons() {
    for(let button of play_buttons) {
        button.classList.remove("hidden");
        document.getElementById("quote_" + button.dataset.id + "_share").classList.add("hidden");
    }
}

function displayShareButton(quote_id) {
    hide_all_share_buttons();
    document.getElementById("quote_" + quote_id + "_share").classList.remove("hidden");
}

for(let button of play_buttons) {
    button.onclick = (event) => {
        if(!event.currentTarget.classList.contains("quote-button-share")) {
            displayShareButton(event.currentTarget.dataset.id);
            event.currentTarget.classList.add("hidden");
        }
        new Audio(event.currentTarget.dataset.audio).play(); 
    }
};

for(let person of people_cards) {
    person.onclick = (event) => {
        window.location.href = event.currentTarget.dataset.link; 
    }
}
