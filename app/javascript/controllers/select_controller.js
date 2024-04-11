import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

// Connects to data-controller="state"
export default class extends Controller {
  static targets = ["select", "state"]
  static values = {
    url: String,
    param: String
  }

  connect(){
    this.stateTarget.addEventListener("change", this.fillCities(this.stateTarget.selectedOptions[0].value))
  }

  change(event) {
    this.fillCities(event.target.selectedOptions[0].value);
  }

  fillCities(value) {
    let params = new URLSearchParams();
    params.append(this.paramValue, value);
    params.append("target", this.selectTarget.id);

    get(`${this.urlValue}?${params}`, {
        responseKind: "turbo-stream"
    });
  }
}
