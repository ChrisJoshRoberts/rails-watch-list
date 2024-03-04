// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Lazy load controllers as they appear in the DOM (remember not to preload controllers in import map!)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
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
