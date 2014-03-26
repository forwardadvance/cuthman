/*jslint browser: true*/
/*global cuthman */

/* Cuthman
 * MVC JavaScript Framework for
 * Forward Advance
 * Coding for the Glory of God
 */
(function () {

  var util = {
    mixin: function (obj, methods) {
      if (obj === undefined) {
        obj = {};
      }
      var i;
      for (i in methods) {
        if (methods.hasOwnProperty(i)) {
          obj[i] = methods[i];
        }
      }
      return obj;
    },
    callbacks: function (obj, args) {
      if (obj.init) {
        obj.init.apply(obj, args);
      }
    }
  };


  var cuthman = {
    controller: function (obj) {
      var controllerMethods = {
        events: $({})
      };
      var controller = util.mixin(obj, controllerMethods);
      util.callbacks(controller, arguments);
      return controller;
    },
    view: function (obj) {
      var
        viewMethods = {
          events: $({}),
          /* Binds a class attribute on the view to an attribute on the model */
          bindClassNameToModel: function (model, attribute, className) {
            className = className || attribute;
            model.events.on(attribute, function () {
              if (model[attribute]) {
                this.el.addClass(className);
              } else {
                this.el.removeClass(className);
              }
            });
          },
        },
        view = util.mixin(obj, viewMethods);
      util.callbacks(view, arguments);
      return view;
    },
    /* The model holds the current state of the object, including any hidden variables.
        Setting an attribute will cause an event to be fired.
     */
    model: function (obj) {
      var
        modelMethods = {
          events: $({}),
          toggle: function (key) {
            this.set(key, !this[key]);
            this.events.trigger(key);
          },
          /* Sets an attribute of this model. Triggers an event if the value changes. */
          set: function (key, value) {
            if (this[key] !== value) {
              this[key] = value;
              console.log('set: ' + (obj.name || 'Object') + '.' + key + ' to ' + value);
              this.events.trigger(key);
            }
          },
          /* Binds an attribute of another model to an attribute of this model.
             This is a two way mapping.
             A change in one triggers a change in the other, and vice versa. */
          bindTo: function (targetModel, targetAttribute, attribute, twoWay) {
            targetModel.events.on(targetAttribute, function () {
              this.set(attribute, targetModel[targetAttribute]);
            });
            if (twoWay) {
              this.events.on(attribute, function () {
                targetModel.set(targetAttribute, this[attribute]);
              });
            }
          }
        },
        model = util.mixin(obj, modelMethods);
      util.callbacks(model, arguments);
      return model;
    },
    toggleButton: function (model, view, attribute, className) {
      var button = {
        model: cuthman.model(model),
        view: cuthman.view(view)
      };
      button.view.model = model;
      button.model.view = view;
      button.view.el.click(function (e) {
        button.model.toggle(attribute);
        e.preventDefault();
      });
      button.view.bindClassNameToModel(button.model, attribute || 'active', className || "active");
    },
  };
  window.cuthman = cuthman;
}());



// (function () {
//   /* Returns a new object with it's own model and view within a closure */
//   var cuthman = function (el) {
//     var obj = {},
//       model,
//       view,
//       i;
//     /* The model holds the current state of the object, including any hidden variables.
//        Setting an attribute will cause an event to be fired.
//     */
//     obj.model = model = {
//       events: $({}),
//       /* Toggles an attribute of this model between true and false. Triggers an event. */
//       toggle: function (key) {
//         model.set(key, !model[key]);
//         model.events.trigger(key);
//       },
//       /* Sets an attribute of this model. Triggers an event if the value changes. */
//       set: function (key, value) {
//         if (model[key] !== value) {
//           model[key] = value;
//           console.log('set: ' + (obj.name || 'Object') + '.' + key + ' to ' + value);
//           model.events.trigger(key);
//         }
//       },
//       /* Binds an attribute of another model to an attribute of this model.
//          This is a two way mapping.
//          A change in one triggers a change in the other, and vice versa. */
//       bindTo: function (targetModel, targetAttribute, attribute, twoWay) {
//         targetModel.events.on(targetAttribute, function () {
//           model.set(attribute, targetModel[targetAttribute]);
//         });
//         if (twoWay) {
//           model.events.on(attribute, function () {
//             targetModel.set(targetAttribute, model[attribute]);
//           });
//         }
//       }
//     };

//     /* The view holds the front end logic. It optionally  */
//     obj.view = view = {
//       /* Binds a class attribute on the view to an attribute on the model */
//       bindAttributeToClassName: function (attribute, className) {
//         className = className || attribute;
//         model.events.on(attribute, function () {
//           if (model[attribute]) {
//             view.el.addClass(className);
//           } else {
//             view.el.removeClass(className);
//           }
//         });
//       },
//       el: el
//     };
//     obj.el = obj.view.el;

//     obj.actsAs = {
//       /* Configures an element as a toggle button */
//       toggleButton: function (attribute, className) {
//         view.el.click(function (e) {
//           model.toggle(attribute);
//           e.preventDefault();
//         });
//         view.bindAttributeToClassName(attribute, className || "selected");
//       }
//     };

//     /* Callbacks */
//     obj.init = obj.events = function (callback) {
//       callback.call(obj);
//       return obj;
//     };
//     return obj;
//   };
//   // cuthman.fn = fn;
//   window.cuthman = cuthman;
// }());
