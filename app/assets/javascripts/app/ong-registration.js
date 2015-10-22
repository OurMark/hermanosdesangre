(function($) {


  $('#new_ong').on('submit', function( event ) {
    var nombre = validarNoVacio($('#ong_name'));
    var direccion = validarNoVacio($('#ong_address'));
    var codigoPostal = validarNoVacio($('#ong_zip'));
    var telefono = validarNoVacio($('#ong_phone'));
    var emailValido = validarEmail();
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
      email.next().html('');
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
    nombre.next().html('');
    return true;
  }

  $('#ong_name').on('blur keyup', function() {
    validarNoVacio($('#ong_name'));
  });

  $('#ong_address').on('blur keyup', function() {
    validarNoVacio($('#ong_address'));
  });

  $('#ong_zip').on('blur keyup', function() {
    validarNoVacio($('#ong_zip'));
  });

  $('#ong_phone').on('blur keyup', function() {
    validarNoVacio($('#ong_phone'));
  });

  $('#ong_adminEmail').on('blur keyup', validarEmail);

}(window.jQuery));