$(document).ready(function() {

  var map = L.mapbox.map('map', 'lchangdev.ij5mliof', { zoomControl: false }).setView([42.353, -71.072], 15);


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
    popupContent = '<div class="popup">' + '<p>' + properties.name + '</p>' + '<a href="#showModal' + properties.id + '" role="button" data-toggle="modal" rel="tooltip">' + 'details' + '</a>' + '</div>';

    marker.bindPopup(popupContent, {
      closeButton: false,
      minWidth: 100,
      maxWidth: 200,
      maxHeight: 200,
    });
  });

  $('li a').click(function() {
    var current = $(this);
    var currentlyClickedName = current.find('span').text();

    featureLayer.eachLayer(function(marker) {
      var id;
      if (marker.feature.properties.name === currentlyClickedName) {
        id = marker._leaflet_id;
        return featureLayer._layers[id].openPopup(marker);
      }
    });
  });

  // move map to middle on marker click
  // featureLayer.on('click', function(data) {
  //   map.panTo(data.layer.getLatLng());
  // });

  var search_params = getSearchQuery("search");

  var geocoder = L.mapbox.geocoder('lchangdev.ij5mliof')

  function getSearchQuery(variable) {
    var query = window.location.search.substring(1);
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split("=");

      if (pair[0] == variable) {
        var unfilteredParams = pair[1]
        var filteredParams = unfilteredParams.replace(/([~!@#$%^&*()_+=`{}\[\]\|\\:;'<>,.\/? ])+/g, " ").replace("2C", "")
        return filteredParams
      }
    }
  }

  function searchMap(err, data) {
    if (data.lbounds) {
        map.fitBounds(data.lbounds);
    } else if (data.latlng) {
        map.setView([data.latlng[0], data.latlng[1]], 13);
    }
  }

  // event when clicking enter in search field
  // $('#search-field').bind('keypress', function(e) {
  //   var code = e.keyCode || e.which;
  //   if(code == 13) {
  //     geocoder.query(search_params, searchMap);
  //   }
  // })

  map.scrollWheelZoom.disable();

  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);

  geocoder.query(search_params, searchMap);
});
