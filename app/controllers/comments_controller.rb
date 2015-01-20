class CommentsController < ApplicationController

def create
  @user = User.find(params[:user_id])
  comment = @user.comments.new
  comment.comment = params[:comment]
  comment.user_id = current_user.id
  if comment.save
    redirect_to @user
  else
    raise
  end
end

def show

end

end