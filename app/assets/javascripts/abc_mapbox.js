$( document ).ready(function() {
  var map = L.mapbox.map('map', 'lchangdev.ij5mliof', { zoomControl: false }).setView([40.72, -74.027], 11);

  $.ajax({
    dataType: 'text',
    url: '/launchers.json',
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
    popupContent = '<div class="popup">' + '<h3>' + properties.address + '</h3>' + '<p>' + properties.address + '</p>' + '</div>';
    return marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 320
    });
  });

  map.scrollWheelZoom.disable();

  new L.Control.Zoom({ position: 'bottomleft' }).addTo(map);

});
