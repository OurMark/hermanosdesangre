class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :find_ong

  def index
    @bookings = Booking.where("ong_id = ? AND end_time >= ?", @ong.id, Time.now).order(:start_time)
    respond_with @bookings
  end

  def new
    @booking = Booking.new(ong_id: @ong.id)
  end

  def create
    @booking =  Booking.new(params[:booking].permit(:ong_id, :start_time, :length))
    @booking.ong = @ong
    if @booking.save
      redirect_to ong_bookings_path(@ong, method: :get)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def day_bookings
    @bookings = Booking.where("date_trunc('day', start_time) = '" + params[:date]} = "'")
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking: #{@booking.start_time.strftime('%e %b %Y %H:%M%p')} to #{@booking.end_time.strftime('%e %b %Y %H:%M%p')} deleted"
      redirect_to ong_bookings_path(@ong)
    else
      render 'index'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    # @booking.ong = @ong

    if @booking.update(params[:booking].permit(:ong_id, :start_time, :length))
      flash[:notice] = 'Your booking was updated succesfully'

      if request.xhr?
        render json: {status: :success}.to_json
      else
        redirect_to ong_bookings_path(@ong)
      end
    else
      render 'edit'
    end
  end

  private

  def save booking
    if @booking.save
        flash[:notice] = 'booking added'
        redirect_to ong_booking_path(@ong, @booking)
      else
        render 'new'
      end
  end

  def find_ong
    if params[:ong_id]
      @ong = Ong.find_by_id(params[:ong_id])
    end
  end

end
