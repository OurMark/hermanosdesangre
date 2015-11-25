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
            var fromTo = $('.from-to.'  + event.target.name);
            if (event.target.checked) {
                fromTo.show(300);
            } else {
                fromTo.hide(300);
            }
        });

        $('input[type="checkbox"].days-all').prop('checked', true);
        $('input[type="checkbox"].days-all').change();

        function sumarTotal(dia){
            var suma = 0;

            ($("."+dia).not('.dia, .total')).each(function(){
                if ($(this).text() != '')
                    suma = suma + parseInt(($(this).text()));
            });

            if (suma != 0){
                $('.total.'+dia).html(suma);
            }else{
                $('.total.'+dia).html('');
            }
        }

        $(".total").each(function(){
            var dia = ($(this).attr('class').split(' ')[2]);
            sumarTotal(dia);
        });

        $(".dia").on('click', (function() {
            var clases = $(this).attr('class'),
                dia = clases.split(' ')[1],
                diaHabilitacion = clases.split(' ')[2];

            if ( diaHabilitacion == 'dia-habilitado'){
                ($("."+dia).not('.dia, .total')).each(function(){
                    $(this).removeClass("habilitado");
                    $(this).addClass("deshabilitado");
                    $(".dia").removeClass("dia-habilitado");

                    //mandar mail y borrar en backend los turnos
                    $(this).html('');
                    $(this).removeClass('completo');
                    //Falta que quede deshabilitado en el sistema
                });
            }else{
                ($("."+dia).not('.dia, .total')).each(function(){
                    $(this).removeClass("deshabilitado");
                    $(this).addClass("habilitado");
                    $(".dia").addClass("dia-habilitado");
                    //Falta que quede habilitado en el sistema
                });
            }

            sumarTotal(dia);

        }));

    });
}(window.jQuery));
