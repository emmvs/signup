// dropmic (for the language dropdown)
import Dropmic from "./dropmic";


const dropdownInit = () => {

  const dropdowns = document.querySelectorAll('[data-dropmic="1"]')
  if(dropdowns) {
    dropdowns.forEach((dropdown) => {
      console.log(dropdown)
       new Dropmic(dropdown);
    })
  }
}

export { dropdownInit };
