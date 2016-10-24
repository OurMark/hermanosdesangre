$(document).ready(function() {
     
    $('#calendar').fullCalendar({
      defaultView: 'agendaWeek',
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'agendaWeek,agendaDay'
      },
      editable: true,
      // overlap: false,
      dayClick: function(date, jsEvent, view) {
        ndate = new Date(moment(date.format()));
         
        d = ndate.getDate();
        m = ndate.getMonth();
        Y = ndate.getFullYear();
        H = ndate.getHours();
        M = ndate.getMinutes();

        hs = H < 10 ? ('0'+H) : H;
        min = M < 10 ? ('0'+M) : M;
        hour = hs + ':' + min;
        
        day = new Date(Y,m,d)
        $('#booking_date').val(day);
        $('#booking_start_at').val(hour);
        $('#time_for_turn').html("Fecha: "+d+'-'+(m + 1)+'-'+Y+' ' + H + ':' + M + ' hs.');
        $('#add_turn').dialog({title: 'Agregar un Turno', close:'cerrar', width: '250', height: '250'});
      },
      businessHours: {
        dow: [ 1, 2, 3, 4, 5 ], // Monday - Friday
        start: '08:00', // a start time (8am in this example)
        end: '18:00' // an end time (6pm in this example)
      },
      events: loadEvents()
    });

});

function loadEvents(){

   var events = []
   $('.event').each(function(index, e){
     turn = $(e)
     events[index] = {
       title: turn.attr('data_user'), 
       start: turn.attr('data_date_start'),
       end: turn.attr('data_date_end'),
       allDay: false,
       overlap: false
     }
   })
   return events;
}
