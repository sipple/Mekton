import { Controller } from "@hotwired/stimulus"

// Fetches select options from the server for a dropdown.
// Used for child item type selection (e.g., choosing armor data for a character armor).
export default class extends Controller {
  static targets = ["select"]
  static values = { url: String }

  connect() {
    this.fetchOptions()
  }

  async fetchOptions() {
    if (!this.hasSelectTarget || !this.urlValue) return

    try {
      const response = await fetch(this.urlValue, {
        headers: { "Accept": "application/json" }
      })
      const options = await response.json()

      this.selectTarget.innerHTML = ""
      for (const [value, label] of Object.entries(options)) {
        const option = document.createElement("option")
        option.value = value
        option.textContent = label
        if (value === this.selectTarget.dataset.selected) {
          option.selected = true
        }
        this.selectTarget.appendChild(option)
      }
    } catch (error) {
      console.error("Failed to fetch select options:", error)
    }
  }
}
