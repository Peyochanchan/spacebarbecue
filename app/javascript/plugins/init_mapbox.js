import mapboxgl from 'mapbox-gl';


const initMapbox = () => {

  const map_data = document.getElementById('map');
  mapboxgl.accessToken = map_data.dataset.mapboxApiKey;
  const markers = JSON.parse(map_data.dataset.markers)

  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const map = new mapboxgl.Map({
    container: 'map', // container ID
    style: 'mapbox://styles/mapbox/streets-v11', // style URL
    // center: [markers.lng, markers.lat], // starting position [lng, lat]
    // zoom: 12 // starting zoom
  });
  const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);

    });
  };
  addMarkersToMap(map, markers);
  fitMapToMarkers(map, markers);

  // const marker =

};



export { initMapbox };
