import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // this.element.textContent = "Hello World!"
    console.log("hello")
    const formButton = document.querySelector('#list-btn');
    if (formButton) {
      formButton.addEventListener('click', event => {
        console.log('working');
        document.querySelector("#list-form").classList.remove("hidden");
        document.querySelector("#list-btn").classList.remove("hidden");
        document.querySelector("#list-close-btn").classList.remove("hidden");
      });
    }

    const closeBtn = document.querySelector("#list-close-btn");

    if (closeBtn) {
      closeBtn.addEventListener('click', event => {
        document.querySelector("#list-form").classList.add("hidden");
        document.querySelector("#list-btn").classList.remove("hidden");
        document.querySelector("#list-close-btn").classList.add("hidden");
      });
    }

  }
}
