(function($) {
  'use strict';

  function pageReder(data) {
    var rows = data.length;
    var pageSize = 3;
    var pages = rows / pageSize;
    var start = 1;
    var end = 3;

    if ((rows % pageSize) !== 0) {
      pages++;
      pages = parseInt(pages);
    }


    var html = '';
    for (var i = start; i <= end; i++) {
      html += '' +
        '<div class="banco col-md-12">' +
        '<div class="ficha_banco">' +
        '<div class="bar-main-container">' +
        '<div class="campania">Septiembre 2014</div><div class="faltandias">20</div>' +
        '<div class="bar-container">' +
        '<div class="objetivo">300</div>' +
        '<div class="bar" style="width: 70%;"><div>70%</div></div>' +
        '<div class="registrados">210</div>' +
        '</div>' +
        '</div>' +
        '<p>' + data[i].phone + ' - ' + data[i].adminEmail + '</p>' +
        '<p>' + data[i].websiteUrl + ' - ' + data[i].facebookPage + '</p>' +
        '<div class="reservar"><a href="/ongs/' + data[i].ong_id + '/turnos/new">Donar aqui,</a></div>' +
        '</div>' +
        '<h3>' + data[i].name + '</h3>' +
        '<h2>' + data[i].address + ',<br/>' + data[i].address2 + '</h2>' +
        '<h4>c.p. ' + data[i].zip + '. ' + data[i].city + ', ' + data[i].state + ', ' + data[i].country_id + '.</h4>' +
        '<div style="clear:both;"></div>' +
        '</div>';
    }

    var currentRows = $(html);
    $('.ongs').append(currentRows);

    $('#ong-list-page-pagging').twbsPagination({
      totalPages: pages,
      visiblePages: 7,
      onPageClick: function(event, page) {
        $('#page-content').text('Page ' + page);
      }
    });

  }


  if ($('.ong-list-page').length > 0) {
    $.get('/ongs.json', pageReder, 'json');
  }

}(window.jQuery));
