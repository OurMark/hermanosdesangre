(function($) {

  $('#new_ong').on('submit', function( event ) {
    var nombre = validarNoVacio($('#ong_name')),
    direccion = validarNoVacio($('#ong_address')),
    codigoPostal = validarNoVacio($('#ong_zip')),
    telefono = validarNoVacio($('#ong_phone')),
    emailValido = validarEmail();

    return nombre && direccion && codigoPostal && telefono && emailValido;
  })

  function validarEmail(){
    var email = $('#ong_adminEmail');

    if ( email.val() === '' ){
      email.next().removeClass('texto-ayuda');
      email.next().addClass('texto-validacion');
      email.addClass('tiene-error');
      email.next().html('Este campo es obligatorio');
      return false;
    }
    if ((/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i).test( email.val())){
      email.removeClass('tiene-error');
      email.next().html('&nbsp;');
      return true;
    }else{
      email.addClass('tiene-error');
      email.next().html('Email incorrecto');
      return false;
    }
  }

  function validarNoVacio(nombre){
    if ( nombre.val() === '' ){
      nombre.addClass('tiene-error');
      if (nombre.next().hasClass('texto-validacion')){
        nombre.next().html('Este campo es obligatorio');
      }else{
        nombre.nextAll('span:first').html('Este campo es obligatorio');
      }
      return false;
    }
    nombre.removeClass('tiene-error');
    nombre.next().html('&nbsp;');
    return true;
  }

  $('#ong_name').on('blur keyup', function(evt) {
    validarNoVacio($(evt.target));
  });

  $('#ong_address').on('blur keyup', function(evt) {
    validarNoVacio($(evt.target));
  });

  $('#ong_zip').on('blur keyup', function(evt) {
    validarNoVacio($(evt.target));
  });

  $('#ong_phone').on('blur keyup', function(evt) {
    validarNoVacio($(evt.target));
  });

  $('#ong_adminEmail').on('blur keyup', validarEmail);

}(window.jQuery));
