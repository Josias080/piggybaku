import "bootstrap";

const piggy_button = document.getElementById("piggy-button");
piggy_button.addEventListener("click", (event) => {
  const baku_form = document.getElementById("baku-form");
  const piggy_form = document.getElementById("piggy-form");
  const baku_button = document.getElementById("baku-button");
  const hidden_field = document.getElementById("is_positive");
  baku_form.classList.add("hidden");
  piggy_form.classList.remove("hidden");
  baku_button.classList.remove("hidden");
  piggy_button.classList.add("hidden");
  hidden_field.value = true;
});

const baku_button = document.getElementById("baku-button");
baku_button.addEventListener("click", (event) => {
  const baku_form = document.getElementById("baku-form");
  const piggy_form = document.getElementById("piggy-form");
  const piggy_button = document.getElementById("piggy-button");
  const hidden_field = document.getElementById("is_positive");
  piggy_form.classList.add("hidden");
  baku_form.classList.remove("hidden");
  piggy_button.classList.remove("hidden");
  baku_button.classList.add("hidden");
  hidden_field.value = false;
});
