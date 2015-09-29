(function($) {
    $('[data-toggle="tooltip"]').tooltip();

  $('.registrarse form').on('submit', function( event ) {
    var contraseniaValida = validarContrasenias();
    var dniValido = validarDni();
    var emailValido = validarEmail();
    return contraseniaValida && dniValido && emailValido;
  })

  function validarContrasenias(){
    var passwordConfirmation = $('#user_password_confirmation');
    var userPassword = $('#user_password');
    if ( userPassword.val() == '' ){
      passwordConfirmation.attr('data-original-title', 'Campo de contraseña vacío');
      passwordConfirmation.tooltip('show');
      return false;
    }else{
     if ( userPassword.val() === passwordConfirmation.val() ){
      passwordConfirmation.tooltip('hide');
      return true;
     }else{
      passwordConfirmation.attr('data-original-title', 'Las contraseñas ingresadas no son iguales');
      passwordConfirmation.tooltip('show');
      return false;
    }
    }
  }

  function validarDni(){
    if ((/^[0-9]{8}$/).test($('#user_user_detail_attributes_dni').val()) ){
      $('#user_user_detail_attributes_dni').tooltip('hide');
      return true;
    }else{
      $('#user_user_detail_attributes_dni').tooltip('show');
      return false;
    }
  }

  function validarEmail(){
    if ((/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i).test( $('#user_username').val())){
      $('#user_username').tooltip('hide');
      return true;
    }else{
      $('#user_username').tooltip('show');
      return false;
    }
  }

  $( "#user_user_detail_attributes_dni" ).blur( validarDni );

  $( "#user_username" ).blur(function() {
    validarEmail();
  });

  $( "#user_password, #user_password_confirmation").blur(function() {
    validarContrasenias();
  });

}(window.jQuery));