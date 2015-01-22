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

  def reply
    conversation = current_user.mailbox.conversations.find(params[:id])
    current_user.reply_to_conversation(conversation, params[:reply][:body])
    redirect_to '/my_messages/' + params[:id]
  end
  
end