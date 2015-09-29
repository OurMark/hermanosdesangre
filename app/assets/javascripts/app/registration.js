(function($) {
    $('[data-toggle="tooltip"]').tooltip();

  $('.btn-registrar').on('click', function( event ) {
    validarContraseñas();
    validarDni();
    validarEmail();
    //falta que se quede en la pagina y no siga
  })

  function validarContraseñas(){
    if ( $('#user_password').val() == $('#user_password_confirmation').val() ){
      $('#user_password_confirmation').tooltip('hide');
    }else{
      $('#user_password_confirmation').tooltip('show');
    }
  }

  function validarDni(){
    if ((/^[0-9]{8}$/).test($('#user_user_detail_attributes_dni').val()) ){
      $('#user_user_detail_attributes_dni').tooltip('hide');
    }else{
      $('#user_user_detail_attributes_dni').tooltip('show');
    }
  }

  function validarEmail(){
    if ((/^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i).test( $('#user_username').val())){
      $('#user_username').tooltip('hide');
    }else{
      $('#user_username').tooltip('show');
    }
  }

  $( "#user_user_detail_attributes_dni" ).blur(function() {
    validarDni();
  });

  $( "#user_username" ).blur(function() {
    validarEmail();
  });

  $( "#user_password, #user_password_confirmation").blur(function() {
    validarContraseñas();
  });

}(window.jQuery));