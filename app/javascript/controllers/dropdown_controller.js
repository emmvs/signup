// stimulus
import { Controller } from "stimulus";

// dropmic (for the language dropdown)
import Dropmic from "../components/dropmic";

export default class extends Controller {
  static targets = ["dropdowns"];

  toggleDropdown() {
    console.log(this.element)
    new Dropmic(this.element);
  }
}
