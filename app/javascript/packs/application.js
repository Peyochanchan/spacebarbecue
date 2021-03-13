// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { flatpickr } from '../plugins/init_flatpickr';
import { initMapbox } from '../plugins/init_mapbox';
import { initSweetalert } from '../plugins/init_sweetalert';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// document.addEventListener("load", function() {
// });
document.addEventListener("turbolinks:load", function() {
  initSweetalert('#sweet-alert', {
    title: "Delete this Booking ???",
    text: "Are you sure",
    buttons: {
      cancel: true,
      confirm: "YES DO IT",
    },
    icon: "warning"
    }, (value) => {
    if (value) {
      const link = document.querySelector('#delete');
      link.click();
    }
  });
    initSweetalert('#sweet-alert-book', {
    title: "Your order is Complete",
    text: "Waiting for the Owner to confirm",
    buttons: {
      cancel: true,
      confirm: "OK",
    },
    icon: "success"
    }, (value) => {
    if (value) {
      const link = document.querySelector('#book');
      link.click();
    }
  });
  initMapbox();
  flatpickr();
  // Call your functions here, e.g:
  // initSelect2();
});
