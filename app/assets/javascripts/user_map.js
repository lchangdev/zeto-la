$(window).load(function() {
  var map = L.mapbox.map('map', 'lchangdev.ij5mliof').setView([42.353, -71.072], 15);

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

    popupContent = '<div class="popup">' + '<p>' + properties.name + '<br>' +
      properties.address + '<br>' + properties.company_name + '</p>' + '</div>';
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 100,
      maxWidth: 200,
      maxHeight: 200,
    });
  });

  map.featureLayer.on('click', function(e) {
          map.panTo(e.layer.getLatLng());
      });

  map.scrollWheelZoom.disable();

  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);

});
