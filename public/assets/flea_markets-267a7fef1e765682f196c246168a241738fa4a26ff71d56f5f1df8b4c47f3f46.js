(function() {
  var list_refresh, list_refresh_smaller, ready;

  list_refresh = function() {
    return $(".flea_market").wookmark({
      autoResize: true,
      container: $("#fleamarket_list"),
      offset: 5,
      outerOffset: 10,
      itemWidth: "45%"
    });
  };

  list_refresh_smaller = function() {
    return $(".flea_market").wookmark({
      autoResize: true,
      container: $("#fleamarket_list"),
      offset: 5,
      outerOffset: 10,
      itemWidth: "75%"
    });
  };

  ready = function() {
    $("#fleamarket_list .flea_market").wookmark({
      autoResize: true,
      container: $("body"),
      offset: 5,
      outerOffset: 10,
      itemWidth: "45%"
    });
    $("body .flea_market img").load(function() {
      return list_refresh();
    });
    $(window).resize(function() {
      if ($(window).width() > 800) {
        return list_refresh();
      } else {
        return list_refresh_smaller();
      }
    });
    $("a[href='#location']").on('shown.bs.tab', function() {
      if ($("#google_map") !== void 0 && $("#google_map").length > 0) {
        google.maps.event.trigger(google_map, 'resize');
      }
      if ($("#daum_map") !== void 0 && $("#daum_map").length > 0) {
        return daum_map.relayout();
      }
    });
    $(window).resize(function() {
      var dm;
      if ($(".map-tab").hasClass("active")) {
        dm = document.getElementById("daum_map");
        dm.style.width = $(".location-map").width() + "px";
        return daum_map.relayout();
      }
    });
    $('body').on("click", ".flea_market__share > a", function(e) {
      e.preventDefault();
      $(this).parent().find('div').toggleClass('flea_market__social--active');
      return $(this).toggleClass('share-expanded');
    });
    if ($('.pagination').length) {
      $(window).scroll(function() {
        var url;
        url = $('.pagination .next a').attr('href');
        if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 250) {
          $('.pagination').html("<div class='loading'><img src='/spread_here/loading.gif'><p>추가 로딩 중 입니다..</p></div>");
          return $.getScript(url);
        }
      });
      return $(window).scroll();
    }
  };

  $(document).ready(ready);

  $(document).on('page:load', ready);

  window.list_refresh = list_refresh;

}).call(this);
