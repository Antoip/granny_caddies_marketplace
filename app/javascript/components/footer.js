const footer = document.querySelector('.footer');
if (document.body.clientHeight < window.innerHeight) {
  footer.classList.add('fixed-bottom');
}
