function hide_all_share_buttons() {
    for(let button of document.getElementsByClassName("default-quote-button")) {
        button.classList.remove("hidden");
        document.getElementById("quote_" + button.dataset.id + "_share").classList.add("hidden");
    }
}

function displayShareButton(quote_id) {
    hide_all_share_buttons();
    document.getElementById("quote_" + quote_id).classList.add("hidden");
    document.getElementById("quote_" + quote_id + "_share").classList.remove("hidden");
}

window.onload = function() {
    var quote_to_play = document.getElementById('quote_to_play');
    if(quote_to_play != null) {
        quote_to_play.scrollIntoView({ behavior: "smooth", block: "center", inline: "center" });
    }

    var play_buttons = document.getElementsByClassName("quote-button");
    var people_cards = document.getElementsByClassName("person-card");
    var copy_quote_buttons = document.getElementsByClassName("copy-quote-url");

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
    
    for(let button of copy_quote_buttons) {
        button.onclick = (event) => {
            var url = window.location.href.split('?')[0];
            var success_button = document.getElementById("quote_" + button.dataset.id + "_copied");
            navigator.clipboard.writeText(url + "?play_id=" + button.dataset.id);
    
            button.classList.add('hidden');
            success_button.classList.remove('hidden');
    
            // reset to default state
            setTimeout(() => {
                button.classList.remove('hidden');
                success_button.classList.add('hidden');
            }, 2000);
        }
    }
}
