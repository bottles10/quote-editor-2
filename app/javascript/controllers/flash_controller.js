import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash"
export default class extends Controller {
  static targets = ["alert"]

  connect() {
    console.log("Flash connected")

    setTimeout(() => {
      this.alertTarget.classList.add("animate-pulse", "fade-in-out")
    }, 3000)

    setTimeout(() => {
      this.alertTarget.classList.add("transform", "scale-75", "transition-all", "duration-300")
    },4500)

    setTimeout(() => {
      this.alertTarget.remove()
    }, 5000)
  }
}
