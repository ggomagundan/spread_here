ready = ->
  $('.delete_post').on 'click', ->
    if confirm("Are you sures?")
      $(this).closest('tr').delay().fadeOut()
    else
      false


$(document).on('turbolinks:load', ready)
