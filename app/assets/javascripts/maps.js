// (function() {
//   $.fn.maps = function() {
    //   var mapOptions = {
    //     center: new google.maps.LatLng(-34.397, 150.644),
    //     zoom: 8
    //   };
    //   var map = new google.maps.Map(document.getElementById("map-canvas"),
    //       mapOptions);
    // }
    // google.maps.event.addDomListener(window, 'load', initialize);

// })();

$(window).ready(function() {
  $('.map').each(function(i, el) {
    var map = $(el),
    lat = map.attr('data-lat'),
    lng = map.attr('data-lng'),
    zoom = parseInt(map.attr('data-zoom'));

    var mapOptions = {
      center: new google.maps.LatLng(lat, lng),
      zoom: zoom
    };
    var map = new google.maps.Map(el, mapOptions);
  })
});
