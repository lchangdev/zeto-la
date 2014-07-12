$(document).ready(function() {
  // create map
  var map = L.mapbox.map('map', 'lchangdev.ij5mliof', { zoomControl: false }).setView([42.353, -71.072], 15);

  // parse user data
  var data = $.parseJSON($.ajax({
    url:  '/users.json',
    dataType: "json",
    async: false
  }).responseText);

  // include user data to map
  var featureLayer = L.mapbox.featureLayer(data).addTo(map)

  // create markers
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

  // store search parameters
  var search_params = getSearchQuery("search");

  // initiate geocoder map
  var geocoder = L.mapbox.geocoder('lchangdev.ij5mliof')

  // convert search params
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

  // move map to search parameters
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

  // disable scroll zoom
  map.scrollWheelZoom.disable();

  // move zoom controls to bottom right
  new L.Control.Zoom({ position: 'bottomright' }).addTo(map);

  // user search query
  geocoder.query(search_params, searchMap);
});
