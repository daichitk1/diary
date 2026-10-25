// Import maps load this module once; delegated listeners survive Turbo navigation.
import "@hotwired/turbo-rails"

document.addEventListener("input", (event) => {
  if (event.target.matches?.("#colorPicker")) {
    document.body.style.backgroundColor = event.target.value
  }
})
