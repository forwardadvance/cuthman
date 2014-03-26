// $(function () {
//   var editToggle,
//     page,
//     slots,
//     slot,
//     addWidget;

//   editToggle = cuthman(null)
//     .init(function () {
//       this.name = "editToggle2";
//       this.view.el = $('<a href="#" class="edit_page"><i class="fa-pencil" />');
//       $('body').prepend(this.view.el);
//     })
//     .events(function () {
//       this.actsAs.toggleButton('active');
//     });

//   page = cuthman($('body'))
//     .init(function () {
//       this.name = "page";
//     })
//     .events(function () {
//       this.model.bindTo(editToggle.model, 'active', 'editable', true);
//     });


//   slots = [];
//   $('.slot').each(function (i, el) {
//     a = 'test'
//     slot = cuthman($(el))
//     slot.init(function () {
//       this.model.capacity = 1;
//       this.name = 'slot ' + i;
//     });
//     slot.view.editable = function () {
//       if (slot.model.editable) {
//         slot.view.makeEditable();
//       } else {
//         slot.view.makeUnEditable();
//       }
//     };
//     slot.view.makeEditable = function () {
//       // slot.
//     }
//     slot.events(function () {
//       this.model.events.on('editable', this.view.editable);
//       this.model.bindTo(page.model, 'editable', 'editable');
//     });
//     slots.push(slot);

//     addButton =
//   });


// });















// (function () {
//   var cuthman = {
//     model: function (model) {
//       var mixins = {
//         toggle: function (key) {
//           model[key] = !model[key];
//           model.events.trigger(key);
//         },
//         set: function (key, value) {
//           if (model[key] !== value) {
//             model[key] = value;
//             model.events.trigger(key);
//           } else {
//             model[key] = value;
//           }
//         }
//       };
//       $.each(mixins, function (i, fnc) {
//         model[i] = fnc;
//       });
//       model.events = $({});
//     },
//     view: function (view) {
//       var mixins = {
//         bindClassNameToModel: function (model, attribute, className) {
//           className = className || attribute;
//           model.events.on(attribute, function () {
//             if (model[attribute]) {
//               view.el.addClass(className);
//             } else {
//               view.el.removeClass(className);
//             }
//           });
//         },
//         actsAs: {
//           toggleButton: function (model, attribute, className) {
//             view.el.click(function (e) {
//               model.toggle(attribute);
//               e.preventDefault();
//             });
//             view.bindClassNameToModel(model, attribute, className || "selected");
//           }
//         }
//       };
//       // Mix the cuthmanjs view methods into the view
//       $.each(mixins, function (i, fnc) {
//         view[i] = fnc;
//       });
//     }
//   };
//   window.cuthman = cuthman;
// }());



// (function () {
//   var model = {
//     init: function () {
//       cuthman.model(this);
//       this.editable = false;
//     }
//   };


//   var editMenuView = {
//   }
//   var editToggleView = {
//     init: function () {
//       cuthman.view(this);
//       this.el = $(
//         '<a href="#" class="edit_page">' +
//           '<i class="fa-pencil" />'
//       );
//       $('body').prepend(this.el);
//       this.events();
//     },
//     events: function () {
//       this.actsAs.toggleButton(model, 'pageEditable');
//     }
//   };

//   var addToggleView = {
//     init: function () {
//       cuthman.view(this);
//       this.el = $(
//         '<a href="#" class="add_page">' +
//           '<i class="fa-plus" />'
//       );
//       $('body').prepend(this.el);
//       this.events();
//     },
//     events: function () {
//       this.actsAs.toggleButton(model, 'addMenuVisible');
//     }
//   };


//   var slotsViews = [];
//   $('slots').each(function() {
//     var el = $(this)
//     var slotView = {
//       init: {
//         cuthman.view(this);
//         this.el = el;
//         this.events();
//         this.model =
//       },
//       events
//     }
//   });

//   $(function () {
//     model.init();
//     editToggleView.init();
//     slotsView.init();
//     addToggleView.init();
//   });
// }());