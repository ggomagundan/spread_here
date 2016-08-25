ready = ->

  messages = $('#messages')
  if messages.length > 0
    scrollBottom = ->
      messages.scrollTop messages.prop("scrollHeight")

    scrollBottom()

    App.chat = App.cable.subscriptions.create({
      channel: "ChatChannel",
      chat_id: messages.data('chatId')
    },
      connected: ->
        #서버 사이드에서 구독을 시작했을 때
      disconnected: ->
        # 서버 사이드에서 구독이 끝났을 때
      received: (data)->
        messages.append data['message']
        scrollBottom()
      sendMessage: (text) ->
        this.perform 'send_message',
          text: text
          chat_id: messages.data('chatId')
    )

$(document).ready(ready)
$(document).on('page:load', ready)
