(function($) {


 /* $('#new_user').on('submit', function( event ) {
    var nombre = validarNoVacio($('#user_name'));
    var apellido = validarNoVacio($('#user_surname'));
    var contraseniaValida = validarContrasenias();
    var dniValido = validarDni();
    var emailValido = validarEmail();
    return nombre && apellido && contraseniaValida && dniValido && emailValido ;
  })*/


  $('#edit_user').on('submit', function( event ) {
    var nombre = validarNoVacio($('#user_name'));
    var apellido = validarNoVacio($('#user_surname'));
    var contrasenia = validarNoVacio($('#user_current_password'));
    var emailValido = validarEmail();
    console.log(nombre);
    console.log(apellido);
    console.log(contrasenia);
    console.log(emailValido);
    return nombre && apellido && contrasenia && emailValido;
  })


   function validarContrasenias(){
    var passwordConfirmation = $('#user_password_confirmation');
    var userPassword = $('#user_password');

    if ( userPassword.val() === ''){
      userPassword.addClass('tiene-error');
      userPassword.parent().parent().next().html('Este campo es obligatorio');
      return false;
    }
    if ( userPassword.val() === passwordConfirmation.val() ){
      userPassword.removeClass('tiene-error');
      passwordConfirmation.removeClass('tiene-error');
      userPassword.parent().parent().next().html('');
      return true;
    }
    userPassword.addClass('tiene-error');
    passwordConfirmation.addClass('tiene-error');
    userPassword.parent().parent().next().html('Las contraseñas ingresadas no son iguales');
    return false;
  }


  function validarDni(){
    var dni = $('#user_user_detail_attributes_dni');
    if ( dni.val() == '' ){
      dni.addClass('tiene-error');
      dni.next().html('Este campo es obligatorio');
      return false;
    }
    if ((/^[0-9]{8}$/).test(dni.val()) ){
      dni.removeClass('tiene-error');
      dni.next().html('');
      return true;
    }
    dni.addClass('tiene-error');
    dni.next().html('DNI inválido');
    return false;
  }

  function validarEmail(){
    var email = $('#user_username');
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

  $('#user_name').on('blur keyup', function() {
    validarNoVacio($('#user_name'));
  });

  $('#user_surname').on('blur keyup', function() {
    validarNoVacio($('#user_surname'));
  });

  $('#user_current_password').on('blur keyup', function() {
    validarNoVacio($('#user_current_password'));
  });

  $('#user_user_detail_attributes_dni').on('blur keyup', validarDni);

  $('#user_username').on('blur keyup', validarEmail);

  $('#user_password, #user_password_confirmation').on('blur keyup', validarContrasenias);

}(window.jQuery));