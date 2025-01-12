let init = document.querySelectorAll("#autofocus")
let divs = document.querySelectorAll("a, label");
let index = Array.prototype.indexOf.call(divs, init[0]);

function updateSelection() {
  divs.forEach((div, idx) => { div.classList.toggle("selected", idx === index) });
  divs[index].focus();
}

document.addEventListener("keydown", (event) => {
  switch (event.key) {
    case "o":
    case "O":
    case "Enter":
    case " ":  // execute selection
      event.preventDefault();
      divs[index].click();  // trigger a mouse click event
      break;
    case "p":
    case "k":
    case "K":
    case "ArrowUp":  // select previous element
      event.preventDefault();
      index = (index - 1 + divs.length) % divs.length;  // wrap to end
      updateSelection();
      break;
    case "n":
    case "j":
    case "J":
    case "ArrowDown":  // select next element
      event.preventDefault();
      index = (index + 1) % divs.length;  // wrap to beginning
      updateSelection();
      break;
    case "Tab":
      event.preventDefault();
      if (event.shiftKey) {
        index = (index - 1 + divs.length) % divs.length;
        updateSelection();
      } else {
        index = (index + 1) % divs.length;
        updateSelection();
      }
      break;
  }
});

document.addEventListener("mouseover", (event) => {
  if (event.target.tagName === "A" || event.target.tagName === "LABEL" ) {
    divs.forEach((div, idx) => { if (event.target === div) { index = idx; } })
    updateSelection();
  }
})

// initial selection
updateSelection();
