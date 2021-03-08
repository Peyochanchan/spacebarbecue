import mapboxgl from 'mapbox-gl';


const initMapbox = () => {
const map_data = document.getElementById('map');
  mapboxgl.accessToken = map_data.dataset.mapboxApiKey;
  const markers = JSON.parse(map_data.dataset.markers)

  const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v11', // style URL
    center: [markers.lng, markers.lat], // starting position [lng, lat]
    zoom: 12 // starting zoom
  });
  const marker = new mapboxgl.Marker()
    .setLngLat([markers.lng, markers.lat])
    .addTo(map);


};

export { initMapbox };
