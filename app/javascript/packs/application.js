import "bootstrap";
import { loadDynamicBannerText } from 'components/banner';
loadDynamicBannerText();
import "../plugins/flatpickr";
import "../bookings/new"

import { initUpdateNavbarOnScroll } from '../components/navbar';
initUpdateNavbarOnScroll();

import "../components/footer"

import 'mapbox-gl/dist/mapbox-gl.css';
import { initMapbox } from '../plugins/init_mapbox';
initMapbox();

import { animatedCards } from '../components/cards-home';
animatedCards();

import { changingPrice } from '../components/price_filter';
changingPrice();
