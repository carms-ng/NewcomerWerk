import "bootstrap";
import "../plugins/flatpickr"
import { loadModal } from '../components/modal';
import { initTabs } from "../components/tabs";
import { loadCarousel } from "../components/carousel";
import { initMarkerStyle } from "../components/marker";

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete'

loadModal();
initTabs();
loadCarousel();
initMapbox();
initAutocomplete();
initMarkerStyle();
