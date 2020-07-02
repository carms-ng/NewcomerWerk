import "bootstrap";
import "../plugins/flatpickr"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { loadModal } from '../components/modal';
import { initTabs } from "../components/tabs";
import { loadCarousel } from "../components/carousel";
// import { fixDiv } from '../components/fixed_div';

initMapbox();
loadModal();
initTabs();
loadCarousel();
// fixDiv();
