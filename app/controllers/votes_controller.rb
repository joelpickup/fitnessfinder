class VotesController < ApplicationController
  load_and_authorize_resource
  def upvote
    @user = User.find(params[:id])
    @user.liked_by current_user
    redirect_to @user
  end
  def downvote
    @user = User.find(params[:id])
    @user.disliked_by current_user
    redirect_to @user
  end
end