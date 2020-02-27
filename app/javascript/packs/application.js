import "bootstrap";

// const submit = () => {
//   alert("ooooo")
//   const value = document.getElementById("search-input").innerHTML
//   console.log(value)
// };

// window.submit = submit;
// onclick="window.submit()

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

