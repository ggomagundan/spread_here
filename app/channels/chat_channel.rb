# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:chat_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
    message = Message.new(user: current_user,
      chat_id: data['chat_id'],
      text: data['text']
    )
    if message.save
      ActionCable.server.broadcast("chat_#{data['chat_id']}",
        message: render_message(message)
    )
    end
  end

  private
  def render_message(message)
    ChatsController.render partial: 'chats/message', locals: {message: message}
  end

end
