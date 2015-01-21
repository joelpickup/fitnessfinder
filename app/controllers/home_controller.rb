class HomeController < ApplicationController
  

  def index
    if current_user
     @user = current_user.id
    end
  end

  def dashboard
    @lesson = Lesson.new
    @upcoming_lessons = current_user.bookings_as_client.where("start_time > ?", Time.now)
    @past_lessons = current_user.bookings_as_client.where("start_time < ?", Time.now).take(5)
    @upcoming_bookings = current_user.bookings_as_instructor.where("start_time > ?", Time.now)
  end
  
end