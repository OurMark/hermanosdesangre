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

        $('.total').each(function(){
            var dia = 0,
                nodo = $(this)[0];

            while( (nodo = nodo.previousElementSibling ) != null )
                dia++;

            sumarTotal(dia);
        });

        $('.dia').on('click', (function() {
            var dia = $(this),
                numeroDia = 0,
                nodo = dia[0],
                tabla;

            while( (nodo = nodo.previousElementSibling ) != null )
                numeroDia++;

            tabla = dia.closest('.tabla-calendario');

            if (($('#calendario td:nth-child('+(numeroDia+1)+')').first()).hasClass('habilitado')){
                $('#calendario td:nth-child('+(numeroDia+1)+')').each(function(){
                    $(this).removeClass('habilitado');
                    $(this).addClass('deshabilitado');

                    //mandar mail y borrar en backend los turnos
                    $(this).html('');
                    $(this).removeClass('completo');
                    //Falta que quede deshabilitado en el sistema
                })
            }else{
                $('#calendario td:nth-child('+(numeroDia+1)+')').each(function(){
                    $(this).removeClass('deshabilitado');
                    $(this).addClass('habilitado');
                    //Falta que quede habilitado en el sistema
                });
            }

            sumarTotal(numeroDia);

        }));

        renderizarSemana(moment().format('DD-MM-YYYY'));
        //Variables globales
        var lunesAnterior, lunesPosterior;

        function renderizarSemana(dia){
        var hoyFormat = 'DD-MM-YYYY',
            lunesEstaSemana, ultimoDiaSemana, lunes, primerFecha, segundaFecha, diasAMostrar;

        lunesAnterior = moment(dia, hoyFormat).startOf('isoweek').day(-6).format(hoyFormat);
        lunesEstaSemana = moment(dia, hoyFormat).startOf('isoweek').format(hoyFormat);
        lunesPosterior = moment(dia, hoyFormat).startOf('isoweek').day(8).format(hoyFormat);

        //A partir del lunes que me traiga la semana
        ultimoDiaSemana = moment(lunesEstaSemana, hoyFormat).add(6, 'days').format(hoyFormat);

        lunes = moment(lunesEstaSemana, hoyFormat),
            diasAMostrar = $('.dia');

            //Muestra los dias de la semana con su numero
            diasAMostrar.eq(0).text(lunes.format('ddd DD'));
            for (var i = 1; i < 7; i++)
                diasAMostrar.eq(i).text(lunes.add(1, 'days').format('ddd DD'));

            //Mostrar rango de dias a mostrar en calendario
            primerFecha = moment(lunesEstaSemana, hoyFormat);
            segundaFecha = moment(ultimoDiaSemana, hoyFormat);
            $('.texto-semana').first().text(primerFecha.format('DD MMMM YYYY')+' - '+segundaFecha.format('DD MMMM YYYY'));

        }

        function renderizarTurnos(){
            /*
            Por cada fila:
                Horario:
                <tr>
                    <th scope="row">8.00</th>

                Si dia bloqueado{
                    <td class="deshabilitado"></td>
                }
                Sino{
                    Si turnos ocupados <> 0 {
                        <td class="habilitado">nro<i></i></td>
                    }
                    Si turnos ocupados = max{
                        <td class="habilitado completo">max<i></i></td>
                    }
                }
                </tr>
            */
        }

        //renderiza semana anterior
        $('.semana-anterior').on('click', (function() {
            renderizarSemana(lunesAnterior);
            //falta que reemplace todos los valores interiores de la tabla, lo tiene q traer de backend
        }));

        //renderiza semana posterior
        $('.semana-posterior').on('click', (function() {
            renderizarSemana(lunesPosterior);
            //falta que reemplace todos los valores interiores de la tabla, lo tiene q traer de backend
        }));

    });
}(window.jQuery));
