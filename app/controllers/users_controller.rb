class UsersController < ApplicationController


  def show
      @user = current_user.id
     
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end

  private
    def set_lesson
      @user = User.find(params[:id])
    end
    

    def user_params
      params.require(:user).permit(:first_name, :last_name, :avatar, :avatar_cache, :remove_avatar, :email, :description, :duration, :price, :instructor_id)
    end

end