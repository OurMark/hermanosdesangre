(function($, Bloodhound) {
  'use strict';

  /**
   * callback function to draw onglist
   * @param  {object} data data callback object
   * @return {void}
   */
  function pageRender(data) {
    try {
      if(data.length <= 0){
          throw new Error('No se encontraron resultados');
      }
      var rows = data.length,
          pageSize = 3,
          pages = (rows / pageSize) - 1,
          start,
          end;

      if ((rows % pageSize) !== 0) {
          pages++;
          pages = parseInt(pages);
      }
      //paggin plugin declaration
      $('#ong-list-page-pagging').twbsPagination({
          totalPages: pages,
          visiblePages: 5,
          onPageClick: function(event, page) {
              drawList(page);
          }
      });

    } catch(e) {
      $('.ongs').html(e.message);
    }

    /**
     * function that draws ongs
     * @param  {integer} currentPage current page value
     * @return {void}
     */
    function drawList(currentPage) {
      var html = '',
        currPage = currentPage ? currentPage : 1;
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
  }

  /**
   * function that invoques and sets ongslist
   * @return {void}
   */
  function setupPaging(){
    if ($('.ong-list-page').length > 0) {
      $.get('/ongs.json', pageRender, 'json');
    }
  }

  /**
   * function that setups the filter
   * @return {void}
   */
  function setupFilter() {
    var $ongfilter = $('#ong-filter.typeahead'),
      $clearFilter = $('#clear-filter'),
      $ongs = $('.ongs');

    function datumTokenizer(d) {
      return Bloodhound.tokenizers.whitespace(d.name);
    }

    function identify(datum) {
      return datum.ong_id;
    }

    function clearPaging() {
      if ($('#ong-list-page-pagging').data("twbs-pagination")) {
        $('#ong-list-page-pagging').twbsPagination('destroy');
      }
    }

    function resetPaging() {
      clearPaging();
      setupPaging();
    }

    var ongs = new Bloodhound({
      datumTokenizer: datumTokenizer,
      queryTokenizer: Bloodhound.tokenizers.whitespace,
      prefetch: 'ongs.json',
      identify: identify
    });

    $ongfilter.typeahead(null, {
      name: 'name',
      source: ongs,
      display: 'name'
    });

    $clearFilter.on('click', function(e) {
      e.preventDefault();
      resetPaging();
      $ongfilter.typeahead('val', '');
    });

    $ongfilter.bind('typeahead:select', function(ev, suggestion) {
      var template = '' +
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
        '<p>' + (suggestion.phone ? suggestion.phone : '...') + ' - ' + (suggestion.adminEmail ? suggestion.adminEmail : '...') + '</p>' +
        '<p>' + (suggestion.websiteUrl ? suggestion.websiteUrl : '...') + ' - ' + (suggestion.facebookPage ? suggestion.facebookPage : '...') + '</p>' +
        '<div class="reservar"><a href="/ongs/' + suggestion.ong_id + '/turnos/new">Donar aqui,</a></div>' +
        '</div>' +
        '<h3>' + suggestion.name + '</h3>' +
        '<h2>' + suggestion.address + ',<br/>' + (suggestion.address2 ? suggestion.address2 : '...') + '</h2>' +
        '<h4>c.p. ' + (suggestion.zip ? suggestion.zip : '...') + '. ' + suggestion.city + ', ' + suggestion.state + ', ' + suggestion.country_id + '.</h4>' +
        '<div style="clear:both;"></div>' +
        '</div>';
      $ongs.html(template);
      clearPaging();
    });
  }

  setupPaging();
  setupFilter();

}(window.jQuery, window.Bloodhound));
