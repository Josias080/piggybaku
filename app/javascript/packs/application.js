import "bootstrap";

const piggy_button = document.getElementById("piggy-button");
const baku_button = document.getElementById("baku-button");
const baku_form = document.getElementById("baku-form");
const piggy_form = document.getElementById("piggy-form");
const baku_img = document.getElementById("baku-img");
const hidden_field = document.getElementById("is_positive");
const piggy_img = document.getElementById("piggy-img");
const animal_img = document.querySelectorAll(".animal-img");

piggy_button.addEventListener("click", (event) => {
  baku_form.classList.add("hidden");
  piggy_form.classList.remove("hidden");
  baku_button.classList.remove("hidden");
  piggy_button.classList.add("hidden");
  baku_img.classList.add("hidden");
  piggy_img.classList.remove("hidden");
  hidden_field.value = true;
});

baku_button.addEventListener("click", (event) => {
  piggy_form.classList.add("hidden");
  baku_form.classList.remove("hidden");
  piggy_button.classList.remove("hidden");
  baku_button.classList.add("hidden");
  piggy_img.classList.add("hidden");
  baku_img.classList.remove("hidden");
  hidden_field.value = false;
});


// $(".toggle-area").click(function () {
//   $(".toggle-area").toggleClass("hidden");
// });