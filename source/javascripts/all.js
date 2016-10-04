//= require_tree .

$(function() {
  /*
   * Retina images
   */
  retinajs( $('.page').find('img') );

  $('#menu').slicknav({
    prependTo: '#mobile-menu',
    label: ''
  });

  /*
   * Search with Lunr.js
   */
  var lunrIndex = null;
  var lunrData  = null;

  var topicsMatcher = function() {
    return function findMatches(q, cb) {
      var results = $.map(lunrIndex.search(q), function(result) {
        var item = lunrData.docs[result.ref];
        return {title: item.title, url: item.url};
      });
      cb(results);
    };
  }

  $.ajax({
    url: '/search.json',
    cache: true,
    method: 'GET',
    success: function(data) {
      lunrData = data;
      lunrIndex = lunr.Index.load(lunrData.index);
    }
  });

  $('#search').typeahead({
    hint: true,
    minLength: 3,
    highlight: true
  },
  {
    name: 'topics',
    limit: 20,
    source: topicsMatcher(),
    display: 'title'
  });

  $('#search').bind('typeahead:select', function(e, item) {
    window.location.href = item.url;
  }).focus();

  /*
   * Sticky sidebar
   */
  if ($('#sidebar').length) {
    $(window).scroll(function() {
      var windowTop = $(window).scrollTop() + 40;
      var divTop = $('#sidebar-anchor').offset().top;

      if (windowTop > divTop) {
        $('#sidebar').addClass('stick');
      } else {
        $('#sidebar').removeClass('stick');
      }
    });
  }

  /*
   * Scrollable toc links
   */
  $('.toc a').click(function(e){
    e.preventDefault();
    $('html,body').scrollTo(this.hash, this.hash);
  });
});
