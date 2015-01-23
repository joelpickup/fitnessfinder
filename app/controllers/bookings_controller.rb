class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html
  load_and_authorize_resource
  def index
    @bookings = Booking.all
    respond_with(@bookings)
  end

  def show
    respond_with(@booking)
  end

  def new
    @booking = Booking.new
    respond_with(@booking)
  end

  def approve
    booking = Booking.find(params[:id])
    booking.status = "approved"
    booking.save
    redirect_to dashboard_path
  end

  def cancel
    booking = Booking.find(params[:id])
    booking.delete
    booking.save
    redirect_to dashboard_path
  end

  def edit
  end

  def create
    x = params[:booking]["lesson_id"] + "_booking"
    y = "_" + params[:booking]["lesson_id"]
    start_time = params[x]["start_time(1i)"] + "-" + params[x]["start_time(2i)"] + "-" + params[x]["start_time(3i)"] + " " + params[:booking]["time"][y] + ":00"
    @booking = Booking.new(booking_params)
    @booking.start_time = start_time
    @booking.end_time = @booking.start_time + @booking.lesson.duration*60
    @booking.save
    redirect_to dashboard_path
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:lesson_id, :start_time, :end_time, :status, :instructor_id, :client_id)
    end
end
