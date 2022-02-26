//= require_tree .
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// import "dropmic"; language flags dropdown
import "../components/language_dropdown";
import { updateLangFlag, updateTargetLangFlag } from "../components/language_dropdown";

// External imports
import "bootstrap";
import "controllers";
import Dropmic from "../components/dropmic";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// // For the live Sign Recordings
import { recordSign } from "../components/record_sign";

document.addEventListener('turbolinks:load', () => {
  // recordSign();
    if(document.querySelector("#start")) {
    recordSign();
  }
// dropmic.close();
  // Call your functions here, e.g:
  // initSelect2();
});

import { initUpdateNavbarOnScroll } from '../components/navbar';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
});

import {updateFocus} from '../components/navbar_button'
