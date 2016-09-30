class BookingsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :find_ong
  layout 'myaccount', only: [:index]

  def index
    calendar_vars
  end

  def new
    @booking = Booking.new(ong_id: @ong.id, start_at: params[:hour])
    @bookings = @ong.bookings
  end

  def create
    #byebug
    @booking =  Booking.new(booking_params)
    @booking.user = current_user
    @booking.ong = @ong
    if @booking.save
      redirect_to ong_bookings_path(@ong)
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def day_bookings
    @bookings = Booking.all #Booking.where("date_trunc('day', start_time) = '" + "#{params[:year]}-#{params[:month]}-#{params[:day]}" + "'")
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    if @booking.destroy
      flash[:notice] = "Booking was deleted."
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

    if @booking.update(params[:booking].permit(:ong_id, :start_time, :length, :dni))
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
      @ong = Ong.find(params[:ong_id])
      Rails.logger.debug @ong.to_json
    end
  end

  def booking_params
    params[:booking].permit(:ong_id, :length, :dni, :date, :start_at)
  end

  def calendar_vars
    @month = params[:month] || Time.now.month
    @year = params[:year] || Time.now.year
    @beds = @ong.beds
    @timelapse = @ong.timelapse
    @inicio_turnos = OngCalendar.where(ong_id: @ong.ong_id).pluck(:day, :start_time)
    @fin_turnos = OngCalendar.where(ong_id: @ong.ong_id).pluck(:day,:end_time)
    @inicio_turnos_diferenciado = OngCalendar.where(ong_id: @ong.ong_id).pluck(:day,:start_time_differential)
    @fin_turnos_diferenciado = OngCalendar.where(ong_id: @ong.ong_id).pluck(:day,:end_time_differental)
    @turnos_ocupados = @ong.bookings
  end

end
