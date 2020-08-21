// This npm package is used to display map on services#index & services#show
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

const mapElement = document.getElementById('map');

// This method hooks up to mapbox, create map with custom map style
const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/carms/ckbqzfkva0ztg1irvucycr7ke'
  });
};

// This function adds the marker to the map
const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    // Create Info Window
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    
    // Create Marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.innerHTML = `<p>$${marker.rate} CAD</p>`;

    popup.on('open', () => {
      element.classList.add('active');
    });
    popup.on('close', () => {
      element.classList.remove('active');
    });
      
    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

// This function controlls the zoom (in)
const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

// This function is exported to application.js
const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    // adds the search box
    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );
    
    // adds the navigation buttons
    map.addControl(new mapboxgl.NavigationControl());

    // hover on services card => the map will re-center on the corresponding marker.
    const cards = document.querySelectorAll(".card-service")
    cards.forEach((card) => {
      card.addEventListener("mouseenter", (e) => {
        map.panTo([card.dataset.lng, card.dataset.lat])
      })
    });
  }
};

export { initMapbox };
