ready = ->
  if $("#flea_market_start_date").length > 0
    $("#flea_market_start_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:ss"
    )
  if $("#flea_market_end_date").length > 0
    $("#flea_market_end_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:ss"
    )

  $(".find-location").click ->
    q = $("#flea_market_location").val()
    url =  "https://apis.daum.net/local/geo/addr2coord?q=" + q + "&output=json&apikey=3eab053a5c7944b47887390d3c3a5493"
    alert url



$(document).ready(ready)
$(document).on('page:load', ready)
