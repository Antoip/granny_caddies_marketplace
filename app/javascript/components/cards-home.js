
const animatedCards = () => {
  const cardanim = document.querySelector(".cards-mf");
  console.log(cardanim)
  if (cardanim) {
    document.addEventListener("click", (event) => {
      cardanim.classList.add("animated")
      cardanim.classList.add("fadeInLeft")
      cardanim.classList.add("delay-0.3")
    });
  }
}

export { animatedCards };
