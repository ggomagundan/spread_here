ready = ->
  messages = $('#messages')
  if messages.length > 0
    $('#new_message').submit (e) ->
      textarea = $(this).find('#message_text')
      if $.trim(textarea.val()).length > 1
        App.chat.sendMessage textarea.val()
        textarea.val ''
      e.preventDefault()
      false

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
