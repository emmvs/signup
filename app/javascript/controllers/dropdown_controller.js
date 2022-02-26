// stimulus
import { Controller } from "stimulus";

// dropmic (for the language dropdown)
import Dropmic from "../components/dropmic";

export default class extends Controller {
  static targets = ["dropdowns"];
  connect() {
    this.dropdownsTargets.forEach(dropdown => {
      new Dropmic(dropdown);
    });
    
  }
}
