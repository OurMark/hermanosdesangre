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

            $('#calendario td:nth-child('+(dia+1)+')').each(function(){
                if ($(this).text() != '')
                    suma = suma + parseInt(($(this).text()));
            });

            if (suma != 0){
                $('#totales-calendario td:nth-child('+(dia+1)+')').html(suma);
            }else{
                $('#totales-calendario td:nth-child('+(dia+1)+')').html('');
            }

        }

        $(".total").each(function(){
            var dia = 0,
                nodo = $(this)[0];

            while( (nodo = nodo.previousElementSibling ) != null )
                dia++;

            sumarTotal(dia);
        });

        $(".dia").on('click', (function() {
            var dia = $(this),
                numeroDia = 0,
                nodo = dia[0],
                tabla;

            while( (nodo = nodo.previousElementSibling ) != null )
                numeroDia++;

            tabla = dia.closest('.tabla-calendario');

            if (dia.hasClass('dia-habilitado')){
                $('#calendario td:nth-child('+(numeroDia+1)+')').each(function(){
                    $(this).removeClass("habilitado");
                    $(this).addClass("deshabilitado");
                    $(".dia").removeClass("dia-habilitado");

                    //mandar mail y borrar en backend los turnos
                    $(this).html('');
                    $(this).removeClass('completo');
                    //Falta que quede deshabilitado en el sistema
                })
            }else{
                $('#calendario td:nth-child('+(numeroDia+1)+')').each(function(){
                    $(this).removeClass("deshabilitado");
                    $(this).addClass("habilitado");
                    $(".dia").addClass("dia-habilitado");
                    //Falta que quede habilitado en el sistema
                });
            }

            sumarTotal(numeroDia);

        }));

        var hoy = "03-01-2016";
        var hoyFormat = "DD-MM-YYYY";
        var dia = moment(hoy, hoyFormat);

        console.log('Dia: ' + dia.format('DD-MM-YYYY'));

        var lunesAnterior = moment(hoy, hoyFormat).startOf('isoweek').day(-6).format('DD-MM-YYYY');
        //console.log('Lunes de semana anterior: ' + lunesAnterior);

        var lunesEstaSemana = moment(hoy, hoyFormat).startOf('isoweek').format('DD-MM-YYYY');
        console.log('Lunes de esta semana: '+ lunesEstaSemana);

        var proximoLunes = moment(hoy, hoyFormat).startOf('isoweek').day(8).format('DD-MM-YYYY');
        //console.log('Lunes de proxima semana: '+ proximoLunes);

        //A partir del lunes que me traiga la semana
        var ultimoDiaSemana;
        ultimoDiaSemana = moment(lunesEstaSemana, hoyFormat).add(6, 'days').format('DD-MM-YYYY');

        var lunes = moment(lunesEstaSemana, hoyFormat);
        console.log('LU '+ lunes.format('DD'));
        console.log('MA '+ lunes.add(1, 'days').format('DD'));
        console.log('MI '+ lunes.add(1, 'days').format('DD'));
        console.log('JU '+ lunes.add(1, 'days').format('DD'));
        console.log('VI '+ lunes.add(1, 'days').format('DD'));
        console.log('SA '+ lunes.add(1, 'days').format('DD'));
        console.log('DO '+ lunes.add(1, 'days').format('DD'));
    });
}(window.jQuery));
