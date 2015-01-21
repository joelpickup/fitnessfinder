class UsersController < ApplicationController

  # def index
  #   if params[:search]
  #     @users
  #   else
  #     # @products = Product.all
  #   end

  #   # render @products, layout: false if request.xhr
  # end

  def show
    @user = set_user
    @booking = Booking.new
  end

  def update
    @user.update(user_params)
    respond_with(@user)
  end



  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :role, :avatar, :avatar_cache, :remove_avatar, :email, :description, :duration, :price, :instructor_id)
    end
end