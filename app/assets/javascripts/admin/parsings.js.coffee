ready = ->
  $('.delete_post').on 'click', ->
    if confirm("Are you sures?")
      row = $(this).closest("tr").get(0)
      $.post(this.href, {_method:'delete'}, null, "script")
      $(row).hide("slow" )
      false
    else
      false


$(document).on('turbolinks:load', ready)
