/*jslint browser: true*/
/*global cuthman */

$(function() {
  if ($('nav.new_content')) {
    var model = cuthman.model({});
    var newContentButton = cuthman.view({
      el: $('nav.new_content');
      init: function() {

      }
    });

    model.init();
  }
})
