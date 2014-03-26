/*jslint browser: true*/
/*global jQuery */

(function ($) {
  $.fn.addWidget = function () {
    $(this).each(function () {
      var slot = $(this);
      var plusButton = $(
        '<div class="widget add_widget">' +
          '<i class="fa-plus" />'
      );
      slot.append(plusButton);
    });
  };

  $.fn.deleteWidget = function () {
    $(this).each(function() {
      var slot = $(this);
    })
  };
}(jQuery));
