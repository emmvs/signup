const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= window.innerHeight/2) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

const updateFocusOnLoad = () => {
  let myButtons = document.querySelectorAll(".btn-link")
  myButtons.forEach(button => {
    button.classList.remove('focus-tab')
  });
  var pathname = window.location.pathname;
  switch (pathname) {
    case "/":
      document.getElementById('homeButton').classList.add('focus-tab');
      break;
    case "/dashboard":
      document.getElementById('dashboardButton').classList.add('focus-tab');
      break;
    case "/bookmarks":
      document.getElementById('bookmarksButton').classList.add('focus-tab');
      break;
      case "/categories":
      document.getElementById('categoriesButton').classList.add('focus-tab');
      break;
  }
}

export { initUpdateNavbarOnScroll, updateFocusOnLoad };
