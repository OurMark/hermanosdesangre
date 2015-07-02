'use strict';

(function($) {
  $(document).on('ready', function() {
    $('.abrir-menu').on('click', function() {
      $('.abrir-menu, .abrir-menu div, .menus').toggleClass('mAbierto');
    });
  });
}(window.jQuery));