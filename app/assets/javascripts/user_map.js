$(document).ready(function() {
  var map = L.mapbox.map('map', 'lchangdev.ij5mliof', { zoomControl: false }).setView([42.353, -71.072], 15)

  var data = $.parseJSON($.ajax({
    url:  '/users.json',
    dataType: "json",
    async: false
  }).responseText);

  var featureLayer = L.mapbox.featureLayer(data).addTo(map)

  featureLayer.eachLayer(function(data) {
    var marker;
    var properties;
    var popupContent;

    marker = data;

    properties = marker.feature.properties;

    popupContent = '<div class="popup">' + '<p>' + properties.name + '<br>' +
      properties.address + '<br>' + properties.company_name + '</p>' + '</div>';

    marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 100,
      maxWidth: 200,
      maxHeight: 200,
    });

  });

  featureLayer.on('click', function(data) {
    map.panTo(data.layer.getLatLng());
  });

  map.scrollWheelZoom.disable();

  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);
});
