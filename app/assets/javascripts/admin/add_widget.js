/*jslint browser: true*/
/*global jQuery */

$(function () {

  if ($('body.widgets.new, body.widgets.create, body.widgets.edit, body.widgets.update').length > 0) {


    var model = {
      init:function () {

      },
      events: $({}),
      set: function (key, val) {
        if (model[key] !== val) {
          model[key] = val;
          model.events.trigger(key);
        }
      }
    };

    var resourceIdField = {
      init: function () {
        this.el = $('#widget_resource_id');
        this.events();
      },
      events: function () {
        model.events.on('resourceId', function() {
          resourceIdField.el.val(model.resourceId);
        });
      }
    };

    var resourceTypeField = {
      init: function () {
        this.el = $('#widget_resource_type');
        this.events();
      },
      events: function () {
        model.events.on('resourceType', function() {
          resourceTypeField.el.val(model.resourceType);
        });
      }
    };

    var contentLinks = {
      init: function () {
        this.el = $('ul.content a');
        this.events();
      },
      events: function () {
        this.el.click(function (e) {
          e.preventDefault();
          var link = $(this);
          model.set('resourceType', link.data('resource-type'));
          model.set('resourceId', link.data('resource-id'));
        });
      }
    };

    model.init();
    contentLinks.init();
    resourceIdField.init();
    resourceTypeField.init();

    window.model = model;
  }
});
