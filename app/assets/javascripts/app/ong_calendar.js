(function($) {
      $(document).on('ready', function() {
        $('.horarios-diferenciados.ALL').toggleClass('hidden');
        $('.accion-horarios-diferenciados').bind('click', function () {
            $('.horarios-diferenciados').toggleClass('hidden');
            $('.accion-horarios-diferenciados').toggleClass('hidden');
        });

        $('.accion-toggle-horario-cortado').bind('click', function () {
            $('.horario-cortado').toggleClass('hidden');
            $('#input_horario_cortado').val($('#input_horario_cortado').val() === '0' ? '1' : '0');
        });

        $('.accion-toggle-horario-cortado-each').click(function (event) {
            $('.horario-cortado.' + event.target.name).toggleClass('hidden');
        });

        $('input[type="checkbox"].days-all').change( function (event) {
            var checks = $('input[type="checkbox"].days-each');
            checks.prop('disabled', event.target.checked );
            if (event.target.checked) {
                checks.prop('checked', event.target.checked);
            }
            checks.change();
        });

        $('input[type="checkbox"].days-each').change(function (event) {
            var fromTo = $('.from-to.'  + event.target.name.slice(0,2));
            if (event.target.checked) {
                fromTo.show(300);
            } else {
                fromTo.hide(300);
            }
        });

        $('input[type="checkbox"].days-all').prop('checked', true);
        $('input[type="checkbox"].days-all').change();

    });
}(window.jQuery));
