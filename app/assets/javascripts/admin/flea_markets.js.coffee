ready = ->
  if $("#flea_market_start_date").length > 0
    $("#flea_market_start_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:00"
    )
  if $("#flea_market_end_date").length > 0
    $("#flea_market_end_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:59"
    )


$(document).ready(ready)
$(document).on('page:load', ready)
