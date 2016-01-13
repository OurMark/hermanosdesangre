(function($) {
  'use strict';

  function pageReder(data) {
    var rows = data.length,
      pageSize = 3,
      pages = (rows / pageSize) - 1,
      start,
      end;

    if ((rows % pageSize) !== 0) {
      pages++;
      pages = parseInt(pages);
    }

    function drawList (currentPage) {
      var html = '',
        currPage = currentPage ? currentPage : 1,
        lastPage = rows;

      start = currPage * pageSize;
      end = Math.min(start + pageSize, rows);

      for (var i = start; i < end; i++) {
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
          '<p>' + (data[i].phone ? data[i].phone : '...') + ' - ' + (data[i].adminEmail ? data[i].adminEmail : '...') + '</p>' +
          '<p>' + (data[i].websiteUrl ? data[i].websiteUrl : '...') + ' - ' + (data[i].facebookPage ? data[i].facebookPage : '...') + '</p>' +
          '<div class="reservar"><a href="/ongs/' + data[i].ong_id + '/turnos/new">Donar aqui,</a></div>' +
          '</div>' +
          '<h3>' + data[i].name + '</h3>' +
          '<h2>' + data[i].address + ',<br/>' + (data[i].address2 ? data[i].address2 : '...') + '</h2>' +
          '<h4>c.p. ' + (data[i].zip ? data[i].zip : '...') + '. ' + data[i].city + ', ' + data[i].state + ', ' + data[i].country_id + '.</h4>' +
          '<div style="clear:both;"></div>' +
          '</div>';
      }


      var currentRows = $(html);
      $('.ongs').html(currentRows);
    }

    $('#ong-list-page-pagging').twbsPagination({
      totalPages: pages,
      visiblePages: 5,
      onPageClick: function(event, page) {
        $('#page-content').text('Page ' + page);
        drawList(page);
      }
    });

  }


  if ($('.ong-list-page').length > 0) {
    $.get('/ongs.json', pageReder, 'json');
  }

}(window.jQuery));
