$(document).ready(function() {
  var map = L.mapbox.map('map', 'lchangdev.ij5mliof', { zoomControl: false }).setView([42.353, -71.072], 15);

  $.ajax({
    dataType: 'text',
    url: '/users.json',
    success: function(data) {
      var geojson;
      geojson = $.parseJSON(data);
      return map.featureLayer.setGeoJSON(geojson);
    }
  });

  map.featureLayer.on('layeradd', function(e) {
    var marker, popupContent, properties;

    marker = e.layer;
    properties = marker.feature.properties;
    popupContent = '<div class="popup">' + '<p>' + properties.name + '<br>' + properties.address + '<br>' + properties.company_name + '</p>' + '</div>';
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 200,
    });
  });

  // map.featureLayer.on('ready', function(e) {
  //   document.getElementById('open-popup').onclick = clickButton;
  // });

  // function clickButton() {
  //   map.featureLayer.eachLayer(function(marker) {
  //     if (marker.feature.properties.name === 'Lawrence Chang') {
  //      marker.popupContent();
  //     };
  //   });
  // };



//   $('article li').click(function(e) {
//   var current, currentlyClickedName;
//   current = $(this);
//   currentlyClickedName = current.find('h2').text();
//   return map.featureLayer.eachLayer(function(marker) {
//     var id;
//     if (marker.feature.properties.name === currentlyClickedName) {
//       id = layer._leaflet_id;
//       return map._layers[id].openPopup();
//     }
//   });
// });

  // map.scrollWheelZoom.disable();

  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);

});
