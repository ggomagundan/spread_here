ready = ->
  if $("#flea_market_start_date").length > 0
    $("#flea_market_start_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:ss"
    )
  if $("#flea_market_end_date").length > 0
    $("#flea_market_end_date").datetimepicker(
      format: "YYYY-MM-DD HH:mm:ss"
    )


$(document).ready(ready)
$(document).on('page:load', ready)
