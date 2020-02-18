import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Roses are red.", "Violets are blue.", "I have a caddy and so you don't!"],
    typeSpeed: 70,
    loop: true
  });
}

export { loadDynamicBannerText };
