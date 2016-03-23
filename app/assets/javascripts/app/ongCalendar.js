(function($) {
  'use strict';

   var lunesAnterior, lunesPosterior, numeroDia;

  function sumarTotal(dia) {
    var suma = 0;
    $('#calendario td:nth-child(' + (dia + 1) + ')').each(function() {
      if ($(this).text() != '')
        suma = suma + parseInt(($(this).text()));
    });

    if (suma != 0) {
      $('#totales-calendario td:nth-child(' + (dia + 1) + ')').html(suma);
    } else {
      $('#totales-calendario td:nth-child(' + (dia + 1) + ')').html('');
    }
  }

  function renderizarSemana(dia) {
    var hoyFormat = 'DD-MM-YYYY',
      lunesEstaSemana, ultimoDiaSemana, lunes, primerFecha, segundaFecha, diasAMostrar;

    lunesAnterior = moment(dia, hoyFormat).startOf('isoweek').day(-6).format(hoyFormat);
    lunesEstaSemana = moment(dia, hoyFormat).startOf('isoweek').format(hoyFormat);
    lunesPosterior = moment(dia, hoyFormat).startOf('isoweek').day(8).format(hoyFormat);
    ultimoDiaSemana = moment(lunesEstaSemana, hoyFormat).add(6, 'days').format(hoyFormat);
    lunes = moment(lunesEstaSemana, hoyFormat),
      diasAMostrar = $('.dia');

    diasAMostrar.eq(0).text(lunes.format('ddd DD'));
    for (var i = 1; i < 7; i++)
      diasAMostrar.eq(i).text(lunes.add(1, 'days').format('ddd DD'));

    primerFecha = moment(lunesEstaSemana, hoyFormat);
    segundaFecha = moment(ultimoDiaSemana, hoyFormat);
    $('.texto-semana').first().text(primerFecha.format('DD MMMM YYYY') + ' - ' + segundaFecha.format('DD MMMM YYYY'));

  }

  function fechaAHora(fecha){
    var hora, minutos, horaCompleta, aux, formato;

    hora = moment(fecha).utc().hour();
    minutos = moment(fecha).utc().minutes();
    aux = hora+':'+minutos;
    formato = 'H:mm';
    horaCompleta = moment(aux,formato);
    return horaCompleta.format(formato);
  }

  function turnosHtml(){
      var turnos;

        for (var dias = 0; dias < 7; dias++){
          /*
          if (dia y horario tiene entre 1 y cant maxima de turnos )
            turnos += '<td class="habilitado">cant turnos<i></i></td>';
          else
            if (dia y horario tiene cant maxima de turnos o mas))
              turnos += '<td class="deshabilitado">cant turnos<i></i></td>';
            else
              turnos += '<td class="habilitado"></td>';
          */
          turnos += '<td class="habilitado"></td>';
        }
        return turnos;
  }

  function imprimirTurnos(duracionTurno, primerHorario, ultimoHorario){
      var formato = 'H:mm',
          horario, ultimo, html;

      horario = moment(primerHorario, formato);
      ultimo = moment(ultimoHorario, formato);
      while ( horario.isBefore(ultimo)){
        html ='<tr><th scope="row">'+ moment(horario, formato).format(formato) +'</th>';
        html += turnosHtml();
        html += '</tr>';
        $('#calendario tr:last').after(html);
        horario.add(duracionTurno,'m');
      }
  }

  function renderizarTurnos() {
    var duracion = lapsoTiempo;

    if ( duracion != 0 )
      imprimirTurnos(duracion, fechaAHora(inicioTurnos), fechaAHora(finTurnos));

    if (fechaAHora(inicioTurnosDiferenciado) != 0 )
      imprimirTurnos(duracion, fechaAHora(inicioTurnosDiferenciado), fechaAHora(finTurnosDiferenciado));
  }

  $(document).on('ready', function() {
    $('#alertaDia').modal({
      keyboard: false,
      show: false
    })

    $('.horarios-diferenciados.ALL').toggleClass('hidden');
    $('.accion-horarios-diferenciados').bind('click', function() {
      $('.horarios-diferenciados').toggleClass('hidden');
      $('.accion-horarios-diferenciados').toggleClass('hidden');
    });

    $('.accion-toggle-horario-cortado').bind('click', function() {
      $('.horario-cortado').toggleClass('hidden');
      $('#input_horario_cortado').val($('#input_horario_cortado').val() === '0' ? '1' : '0');
    });

    $('.accion-toggle-horario-cortado-each').click(function(event) {
      $('.horario-cortado.' + event.target.name).toggleClass('hidden');
    });

    $('input[type="checkbox"].days-all').change(function(event) {
      var checks = $('input[type="checkbox"].days-each');
      checks.prop('disabled', event.target.checked);
      if (event.target.checked) {
        checks.prop('checked', event.target.checked);
      }
      checks.change();
    });

    $('input[type="checkbox"].days-each').change(function(event) {
      var fromTo = $('.from-to.' + event.target.name.slice(0, 2));
      if (event.target.checked) {
        fromTo.show(300);
      } else {
        fromTo.hide(300);
      }
    });

    $('input[type="checkbox"].days-all').prop('checked', true);
    $('input[type="checkbox"].days-all').change();

    $('.total').each(function() {
      var dia = 0,
          nodo = $(this)[0];

      while ((nodo = nodo.previousElementSibling) != null){
        dia++;
      }
      sumarTotal(dia);
    });

    $('.semana-anterior').on('click', (function() {
      renderizarSemana(lunesAnterior);
      //falta que reemplace todos los valores interiores de la tabla, lo tiene q traer de backend
    }));

    $('.semana-posterior').on('click', (function() {
      renderizarSemana(lunesPosterior);
      //falta que reemplace todos los valores interiores de la tabla, lo tiene q traer de backend
    }));

    $('.btn-ok').on('click enter', function (e) {
      $('#alertaDia').modal('hide');
      $('#calendario td:nth-child(' + (numeroDia + 1) + ')').each(function() {
          $(this).removeClass('habilitado');
          $(this).addClass('deshabilitado');
          //Falta mandar mail y borrar en backend los turnos
          $(this).html('');
          $(this).removeClass('completo');
          //Falta que quede deshabilitado en el sistema
      })
    })

    $('.dia').on('click', (function() {
      var dia = $(this),
          nodo = dia[0],
          tabla;

      numeroDia = 0;
      while ((nodo = nodo.previousElementSibling) != null){
        numeroDia++;
      }
      tabla = dia.closest('.tabla-calendario');
      if (($('#calendario td:nth-child(' + (numeroDia + 1) + ')').first()).hasClass('habilitado')) {
        if ( $('#totales-calendario td:nth-child(' + (numeroDia + 1) + ')').html() !== ''){
            $('#alertaDia').modal('show');
        }else{
          $('#calendario td:nth-child(' + (numeroDia + 1) + ')').each(function() {
            $(this).removeClass('habilitado');
            $(this).addClass('deshabilitado');
            //Falta mandar mail y borrar en backend los turnos
          })
        }
      } else {
        $('#calendario td:nth-child(' + (numeroDia + 1) + ')').each(function() {
          $(this).removeClass('deshabilitado');
          $(this).addClass('habilitado');
          //Falta que quede habilitado en el sistema
        });
      }
      sumarTotal(numeroDia);

    }));

    renderizarSemana(moment().format('DD-MM-YYYY'));
    renderizarTurnos();


    //only for calendar configuration
    if ($('.configuracion-atencion').length > 0) {

      var $ongid = $('#calendar_ong_id').val();
      var promise = $.getJSON('/ongs/'+ $ongid +'/calendar.json');

      // success
      promise.done(function(data){
        $.each(data, function(index, calendar){
          var startTime = new Date(calendar.start_time).getHours();
          var endTime = new Date(calendar.end_time).getHours();
          console.log(JSON.stringify(calendar));
        });
      });

      // error
      promise.fail(function(jqXHR, textStatus, errorThrown){
        console.log('request error: ' + textStatus);
        console.log(errorThrown);
      });
    }


  });
}(window.jQuery));