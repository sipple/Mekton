import { Controller } from "@hotwired/stimulus"

// Toggles a field between display mode and edit mode on click.
// When in edit mode, shows a small form that submits via Turbo.
// On successful Turbo Stream response, reverts to display mode.
export default class extends Controller {
  static targets = ["display", "form"]
  static values = { editing: { type: Boolean, default: false } }

  connect() {
    this.showDisplay()
  }

  toggle() {
    this.editingValue = !this.editingValue
    if (this.editingValue) {
      this.showForm()
    } else {
      this.showDisplay()
    }
  }

  cancel() {
    this.editingValue = false
    this.showDisplay()
  }

  // Called by Turbo after successful form submission
  submitted() {
    this.editingValue = false
    this.showDisplay()
  }

  showDisplay() {
    if (this.hasDisplayTarget) this.displayTarget.classList.remove("hidden")
    if (this.hasFormTarget) this.formTarget.classList.add("hidden")
  }

  showForm() {
    if (this.hasDisplayTarget) this.displayTarget.classList.add("hidden")
    if (this.hasFormTarget) this.formTarget.classList.remove("hidden")
  }
}
