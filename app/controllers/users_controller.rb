class UsersController < ApplicationController

  # def index
  #   @users = User.all
  #   respond_with(@users)
  # end

  # def show
  #   respond_with(@user)
  # end

  # def edit

  # end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_image)
  end

  private
    def set_lesson
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :description, :duration, :price, :instructor_id)
    end

end