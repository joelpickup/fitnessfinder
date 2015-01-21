class MessagesController < ApplicationController

  def messages
    @conversations = current_user.mailbox.conversations
  end

  def conversation
    @conversation = current_user.mailbox.conversations.find(params[:id])
    @messages = @conversation.messages
  end
  
end