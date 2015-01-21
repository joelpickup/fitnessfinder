class MessagesController < ApplicationController

  def messages
    @conversations = current_user.mailbox.conversations
    @conversation
  end

  def create
    sender = current_user
    recipient = User.find(params[:conversation][:recipient])
    sender.send_message(recipient, params[:conversation][:body], params[:conversation][:title])
    redirect_to '/my_messages'
  end

  def conversation
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @messages = @conversation.messages
  end
  
end