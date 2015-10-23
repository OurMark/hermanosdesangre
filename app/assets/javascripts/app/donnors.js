'use strict';
(function ($) {
  $(document).on("ready", function () {

    function Sel(n){
      /*funcion Sel(eccionar) damos la clase a la nueva seleccion*/
      $(".Opciones>div:nth-child("+n+")").toggleClass("seleccionada");
      $(".Secciones>div:nth-child("+n+"), .Opciones").toggleClass("seleccionada");
    };

    /*definimos los botones*/
    $(".Opciones>div:nth-child(1)").click(function(){Sel(1);});
    $(".Opciones>div:nth-child(2)").click(function(){Sel(2);});
    $(".Opciones>div:nth-child(3)").click(function(){Sel(3);});
    $(".Opciones>div:nth-child(4)").click(function(){Sel(4);});

    /*definimos sub-boton*/
    $(".Secciones>div:nth-child(3) h2, .bolsa").click(function(){
      $(".Secciones .seleccionada ul, .Secciones .seleccionada h2").toggleClass("seleccionada");
      $(".bolsa").toggleClass("llena");
    });

    /* por si viene de un link*/
    var $_GET = {};
    document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
      function decode(s) {
          return decodeURIComponent(s.split("+").join(" "));
      }
      $_GET[decode(arguments[1])] = decode(arguments[2]);
    });

    if ($_GET['s'] === "impacto"){Sel(1);};if ($_GET['s'] === "requisitos"){Sel(2);};
    if ($_GET['s'] === "consejos"){Sel(3);};if ($_GET['s'] === "informacion"){Sel(4);};

  });
}(window.jQuery));
