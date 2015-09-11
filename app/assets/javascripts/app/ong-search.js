
(function($) {
      $(document).on('ready', function() {
        var ongs = new Bloodhound({
            datumTokenizer: function (d) {
                return Bloodhound.tokenizers.whitespace(d.name);
            },
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch:'ongs.json',
            identify: function (datum) {
                return datum.ong_id
            }
        });

        $('#name.typeahead').typeahead(null, {
          name: 'name',
          source: ongs,
          display: 'name'
        });
    });
}(window.jQuery));
