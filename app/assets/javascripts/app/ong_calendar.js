
(function($) {
      $(document).on('ready', function() {
        $('#accion-horarios-diferenciados').bind('click', function () {
            $('.horarios-diferenciados').toggleClass('hidden');
        });

        $('.accion-toggle-horario-cortado').bind('click', function () {
            $('.horario-cortado').toggleClass('hidden');
            $('#input_horario_cortado').val($('#input_horario_cortado').val() === '0' ? '1' : '0');
        });
        $('input[type="checkbox"].dayEnabled').bind('click', function (event) {
        console.log(event);
            if (event.target.checked === true) {
                $('.from-to.'  + event.target.name).toggleClass('hidden');
            }
            // body...
        });
    });
}(window.jQuery));
