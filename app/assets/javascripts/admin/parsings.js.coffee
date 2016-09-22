ready = ->

  del_obj = null
  $('.temp_del').on 'click', ->
    $(this).addClass "delete_post"

  $('.delete_post').on 'click', ->
    row = $(this).closest("tr").get(0)
    $.post(this.href, {_method:'delete'}, null, "script")
    $(row).hide("slow" )
    del_obj = $(row)
    false
  $(".eee").on "click", ->
    $(del_obj).show()


$(document).on('turbolinks:load', ready)
$(document).on('page:change', ready)
