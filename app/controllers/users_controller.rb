class UsersController < ApplicationController

  # def index
  #   @users = User.all
  #   respond_with(@users)
  # end

  def show
    @user = set_user

  end

  # def edit

  # end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :description, :duration, :price, :instructor_id)
    end

end