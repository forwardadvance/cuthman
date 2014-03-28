/*jslint browser: true*/
/*global google */

$(window).ready(function () {
  $('.map').each(function (i, el) {
    var
      $el = $(el),
      lat = parseFloat($el.attr('data-lat'), 10),
      lng = parseFloat($el.attr('data-lng'), 10),
      zoom = parseInt($el.attr('data-zoom'), 10),
      latLng = new google.maps.LatLng(lat, lng),
      mapOptions = {
        center: latLng,
        zoom: zoom
      },
      map = new google.maps.Map(el, mapOptions),
      marker = new google.maps.Marker({
        position: latLng,
        map: map,
        animation: google.maps.Animation.DROP,
        title: "St Cuthman's"
      }),
      infowindow = new google.maps.InfoWindow({
        content: '<a href="https://www.google.co.uk/maps/place/St+Cuthmans+C+Of+E+Church/@50.82824,-0.105356,17z/data=!3m1!4b1!4m2!3m1!1s0x487585e8de2d04e5:0xf86de2535b64f4d2">View in Google Maps</a>'
      });
    infowindow.open(map, marker);

  });
});
