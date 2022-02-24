import { grep } from "jquery";
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["usa", "ger"]
  connect() {
    console.log("Hello from your first Stimulus controller")
  }
  disable(event) {
    // console.log(event);
    // this.usaTarget.disable;
    if (this.usaTarget) {
      if (this.gerTarget.classList.contains("flag-container")) {
        event.currentTarget.classList.toggle("flag-container-clicked");
        event.currentTarget.classList.toggle("flag-container");
      } else {
        event.currentTarget.disable
      }
    }
    if (this.gerTarget) {
      if (this.usaTarget.classList.contains("flag-container")) {
        event.currentTarget.classList.toggle("flag-container-clicked");
        event.currentTarget.classList.toggle("flag-container");
      } else {
        event.currentTarget.disable
      }
    }
  }
}
