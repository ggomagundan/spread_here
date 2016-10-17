ready = ->


#  if $("#flea_market_start_date").length > 0
#    $("#flea_market_start_date").datetimepicker(
#      format: "YYYY-MM-DD HH:mm:ss"
#    )
#  if $("#flea_market_end_date").length > 0
#    $("#flea_market_end_date").datetimepicker(
#      format: "YYYY-MM-DD HH:mm:ss"
#    )

  sendFile = (file) ->
    data = new FormData
    data.append 'content_image[image]', file
    $.ajax
      data: data
      type: 'POST'
      url: '/api/uploads'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        $("#flea_market_bottom_text").summernote "insertImage", data.url
  deleteFile = (file_url) ->
    del_data = new FormData
    del_data.append 'content_image[url]', file_url
    $.ajax
      data: del_data
      type: 'DELETE'
      url: '/api/removes'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        if data.status is false
          alert "Delete Fail"

        true


  if $("#flea_market_top_text").length > 0
    $('#flea_market_top_text').summernote()
  if $("#flea_market_bottom_text").length > 0
    sum = $('#flea_market_bottom_text').summernote
      callbacks:
        onImageUpload: (files) ->
          sendFile files[0]
        onMediaDelete: ($target, editor, $editable) ->
          deleteFile $target[0].src
        onChange: (editor, $editable) ->
          #alert editor
          #alert "sef"

  $("body").on "click", ".set-latlon", ->
    $("#flea_market_latitude").val $(this).data "lat"
    $("#flea_market_longitude").val $(this).data "lon"

  moment.locale('ko')
  #toggleButton = $("#flea_market_market_name")
  startDayEle = document.getElementById("start_day")
  startTimeEle = document.getElementById("start_time")
  endDayEle = document.getElementById("end_day")
  endTimeEle = document.getElementById("end_time")

  startDayDialog = new mdDateTimePicker.default(
    type: 'date',
    future: moment().add(4, 'months'),
    locale: "ko",
    trigger: startDayEle 
  )

  startTimeDialog = new mdDateTimePicker.default(
    type: 'time',
    locale: "ko",
    trigger: startTimeEle 
  )

  endDayDialog = new mdDateTimePicker.default(
    type: 'date',
    future: moment().add(4, 'months'),
    locale: "ko",
    trigger: endDayEle 
  )

  endTimeDialog = new mdDateTimePicker.default(
    type: 'time',
    locale: "ko",
    trigger: endTimeEle 
  )



  if startDayEle != null
    startDayEle.addEventListener "click", ->
      startDayDialog.toggle()
    startDayEle.addEventListener "onOk", (e) ->
      this.value = startDayDialog.time.format('YYYY-MM-DD')
      $("#flea_market_start_date").val $("#start_day").val() + " " + $("#start_time").val()
      if $("#flea_market_end_date").val() is ""
        $("#flea_market_end_date").val startDayDialog.time.format('YYYY-MM-DD')
        $("#end_day").val startDayDialog.time.format('YYYY-MM-DD')

  if startTimeEle != null
    startTimeEle.addEventListener "click", ->
      startTimeDialog.toggle()
    startTimeEle.addEventListener "onOk", (e) ->
      this.value = startTimeDialog.time.format('HH:mm')
      $("#flea_market_start_date").val $("#start_day").val() + " " + $("#start_time").val()

  if endDayEle != null
    endDayEle.addEventListener "click", ->
      endDayDialog.toggle()
    endDayEle.addEventListener "onOk", (e) ->
      this.value = endDayDialog.time.format('YYYY-MM-DD')
      $("#flea_market_end_date").val $("#end_day").val() + " " + $("#end_time").val()

  if endTimeEle != null
    endTimeEle.addEventListener "click", ->
      endTimeDialog.toggle()
    endTimeEle.addEventListener "onOk", (e) ->
      this.value = endTimeDialog.time.format('HH:mm')
      $("#flea_market_end_date").val $("#end_day").val() + " " + $("#end_time").val()



  $(".find-location").click ->
    q = $("#flea_market_location").val()
    url =  "https://apis.daum.net/local/geo/addr2coord?q=" + q + "&output=json&apikey=3eab053a5c7944b47887390d3c3a5493"
    $.ajax(
      url: "/api/flea_markets/get_latlon"
      type: "get"
      dataType: "json"
      data:
        addr: q
    ).success (json) ->
      if json.length < 1
        alert "Check ADDR"
      else
        $(".latlon-lists div.latlon-list").remove()
        $.each json, (index, data) ->
          str = ""
          str += "ADR: " + data.title
          str += ",   LAT: " + data.point_y
          str += ",   LON: " + data.point_x
          str += " <span class='set-latlon label label-primary' data-lat='" + data.point_y + "' data-lon='" + data.point_x + "'>SET</span>"
          $(".latlon-lists .controls").append str
    return false


  $(document).on "submit", "form[method=get]", (e) ->
    Turbolinks.visit(this.action + (if this.action.indexOf('?') ==  -1 then '?' else '&') + $(this).serialize())
    return false


#$(document).ready(ready)

$(document).on('turbolinks:load', ready)
$(document).on('page:change', ready)

