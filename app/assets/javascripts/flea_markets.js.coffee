list_refresh = ->
  $(".flea_market").wookmark
    autoResize: true
    container: $("#fleamarket_list")
    offset: 5
    outerOffset: 10
    itemWidth: "45%"

ready = ->

  $("#fleamarket_list .flea_market").wookmark
    autoResize: true
    container: $("body")
    offset: 5
    outerOffset: 10
    itemWidth: "40%"

  $("body .flea_market img").load ->
    list_refresh()


  $("a[href='#location']").on 'shown.bs.tab', ->
    if $("#google_map") != undefined && $("#google_map").length > 0
       google.maps.event.trigger(google_map, 'resize')
    if $("#daum_map") != undefined && $("#daum_map").length > 0
      daum_map.relayout()

  $(window).resize ->
    if $(".map-tab").hasClass "active"
      dm = document.getElementById("daum_map")
      dm.style.width = $(".location-map").width() + "px"
      daum_map.relayout()


  $('.flea_market__share > a').on 'click', (e) ->
    e.preventDefault()
    # prevent default action - hash doesn't appear in url
    $(this).parent().find('div').toggleClass 'flea_market__social--active'
    $(this).toggleClass 'share-expanded'

# EVENT LISTS PAGE TO INFINITY SCROLL

  if $('.pagination').length
    $(window).scroll ->
      url = $('.pagination .next a').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 250
        $('.pagination').html("<div class='loading'><img src='/assets/mobile/global/gif_loading.gif'><p>추가 로딩 중 입니다..</p></div>")
        $.getScript(url)
    $(window).scroll()



$(document).ready(ready)
$(document).on('page:load', ready)


window.list_refresh = list_refresh
