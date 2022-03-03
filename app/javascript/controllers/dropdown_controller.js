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

// ****** old JS Code ******* language dropdown – click flag => flag changes %> *******
//   const updateLangFlag = (flag) => {
//     var chosenLangButton = document.getElementById("chosen_flag");
//     let chosenLangImage = document.getElementById(flag+"-img");
//     var getChosenFlagLink = chosenLangImage.src;
//     chosenLangButton.src = getChosenFlagLink;
//   }

//     function updateTargetLangFlag(flag) {
//       console.log(flag)
//       var chosenLangButton = document.getElementById("tl-chosen_flag");
//       let chosenLangImage = document.getElementById(flag+"-img");
//       var getChosenFlagLink = chosenLangImage.src;
//       chosenLangButton.src = getChosenFlagLink;
//     }
