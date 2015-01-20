class UsersController < ApplicationController

  # def index
  #   @users = User.all
  #   respond_with(@users)
  # end

<<<<<<< HEAD
  # def show
  #   respond_with(@user)
  # end

=======
  def show
      @user = current_user.id
      # binding.pry
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end
>>>>>>> development
  # def edit

  # end

<<<<<<< HEAD
=======

>>>>>>> development
  private
    def set_lesson
      @user = User.find(params[:id])
    end

    def user_params
<<<<<<< HEAD
      params.require(:user).permit(:name, :description, :duration, :price, :instructor_id)
=======
      params.require(:user).permit(:first_name, :last_name, :avatar, :avatar_cache, :remove_avatar, :email, :description, :duration, :price, :instructor_id)
>>>>>>> development
    end

end