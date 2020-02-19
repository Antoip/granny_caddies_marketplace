const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navLinks = document.querySelectorAll('.nav-link');
  if (navbar) {
    const test_index = document.getElementById('home-card-list')
    if (test_index) {
      navbar.classList.add('fixed-top')
      window.addEventListener('scroll', () => {
        if (window.scrollY >= window.innerHeight) {
          navbar.classList.add('navbar-lewagon-white');
          navLinks.forEach((link) => {
            link.classList.add('text-dark')
          })
        } else {
          navbar.classList.remove('navbar-lewagon-white');
          navLinks.forEach((link) => {
            link.classList.remove('text-dark')
          })
        }
      });
    } else {
      navbar.classList.add('sticky-top')
      navbar.classList.add('navbar-lewagon-white')
    }
  }
}

export { initUpdateNavbarOnScroll };
