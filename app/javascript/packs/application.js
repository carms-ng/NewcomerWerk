import "bootstrap";
import "../plugins/flatpickr"

// const submit = () => {
//   alert("ooooo")
//   const value = document.getElementById("search-input").innerHTML
//   console.log(value)
// };

// window.submit = submit;
// onclick="window.submit()

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import { initMapbox } from '../plugins/init_mapbox';
import { loadModal } from '../components/modal';
import { receivedReview, writtenReview } from '../plugins/init_tabs';

import { effect } from '../components/buttons_effects';

initMapbox();
loadModal();
effect();

window.receivedReview = receivedReview
window.writtenReview = writtenReview
