(function($) {
  'use strict';

  $(document).on('ready', function() {

    function sel(n) {
      /*funcion sel(eccionar) damos la clase a la nueva seleccion*/
      $('.Opciones>div:nth-child(' + n + ')').toggleClass('seleccionada');
      $('.Secciones>div:nth-child(' + n + '), .Opciones').toggleClass('seleccionada');
    }

    /*definimos los botones*/
    $('.Opciones>div:nth-child(1)').click(function() {
      sel(1);
    });
    $('.Opciones>div:nth-child(2)').click(function() {
      sel(2);
    });
    $('.Opciones>div:nth-child(3)').click(function() {
      sel(3);
    });
    $('.Opciones>div:nth-child(4)').click(function() {
      sel(4);
    });

    /*definimos sub-boton*/
    $('.Secciones>div:nth-child(3) h2, .bolsa').click(function() {
      $('.Secciones .seleccionada ul, .Secciones .seleccionada h2').toggleClass('seleccionada');
      $('.bolsa').toggleClass('llena');
    });

    /* por si viene de un link*/
    var $_GET = {};
    document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function() {
      function decode(s) {
        return decodeURIComponent(s.split('+').join(' '));
      }
      $_GET[decode(arguments[1])] = decode(arguments[2]);
    });

    if ($_GET.s === 'impacto') {
      sel(1);
    }
    if ($_GET.s === 'requisitos') {
      sel(2);
    }
    if ($_GET.s === 'consejos') {
      sel(3);
    }
    if ($_GET.s === 'informacion') {
      sel(4);
    }

  });

}(window.jQuery));
