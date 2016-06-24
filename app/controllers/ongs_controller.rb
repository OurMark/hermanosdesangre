class OngsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_ong, only: [:show, :edit, :bookings]
  layout 'myaccount', only: [:calendar, :ong_search, :index, :new, :edit]

  # GET /ongs
  # GET /ongs.json
  def index
    @ongs = Ong.all
    respond_to do |format|
      format.html
      format.json { render json: @ongs  }
    end
  end

  def user_ongs
    @ongs = current_user.ongs
  end

  # GET /ongs/1
  # GET /ongs/1.json
  def show
  end

  # GET /ongs/new
  def new
    @ong = current_user.ongs.build
    #@ong.build_ong_detail
  end

  # GET /ongs/1/edit
  def edit
  end

  # POST /ongs
  # POST /ongs.json
  def create
    @ong = Ong.new(ong_params)
    @ong.hasImage = 1

    respond_to do |format|
      if @ong.save
        current_user.ongs << @ong
        @ong.create_ong_detail(beds: params[:ong][:beds], timelapse: params[:ong][:timelapse])
        format.html { redirect_to ong_registered_path}
        format.json { render :show, status: :created, location: @ong }
      else
        format.html { render :new }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ongs/1
  # PATCH/PUT /ongs/1.json
  def update
    @ong = current_user.ongs.find(params[:id])
    respond_to do |format|
      if @ong.update(ong_params)
        @ong.ong_detail.update(beds: params[:ong][:beds], timelapse: params[:ong][:timelapse])
        format.html { redirect_to @ong, notice: 'Ong was successfully updated.' }
        format.json { render :show, status: :ok, location: @ong }
      else
        format.html { render :edit }
        format.json { render json: @ong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ongs/1
  # DELETE /ongs/1.json
  def destroy
    @ong = current_user.ongs.find(params[:ong_id])
    @ong.destroy
    respond_to do |format|
      format.html { redirect_to ongs_url, notice: 'Ong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def ong_registered
  end

  def ong_search
    if params['q']
      # buscamos la ong
      @ongs = Ong.includes(:topics).where(topic: { name: 'BLOOD_DONATION' }).where('ong.name like ?','%'+params['q']+'%')
    end
    respond_to do |format|
      format.html
      format.json { render json: @ongs }
    end
  end

  def calendar
    @ong = Ong.find(params[:ong_id])
    @ong_calendar = @ong.ong_calendars
    @days = ['ALL', 'LU', 'MA', 'MI' , 'JU', 'VI', 'SA', 'DO']
    @intervalo_horario = []
    (00..23).each do |hour|
      ['00', '30'].each do |minutes|
        @intervalo_horario.append(hour.to_s + ':' + minutes)
      end
    end
    @duracion_turnos = ['30', '45', '60']
    respond_to do |format|
      format.html
      format.json { render json: @ong_calendar  }
    end
  end

  def save_calendar
    @days = [:LU, :MA, :MI, :JU, :VI, :SA, :DO]
    logger.info 'Find ong'
    @ong = Ong.find(params[:ong_id])

    @days.each do |day|
      # if all days param is set
      unless params[:dayall].nil?
        calendar = @ong.ong_calendars.find_or_create_by(day: day)
        calendar.start_time = params[:ALL][:inicio]
        calendar.end_time = params[:ALL][:hasta]
        calendar.start_time_differential = params[:ALL][:inicio_cortado]
        calendar.end_time_differental = params[:ALL][:hasta_cortado]
        calendar.day = day
        calendar.save
      else
        # if not set all days param and we select specific
        # hours for each day
        if params[:ALL][:inicio] == '0:00' and params[:ALL][:hasta] == '0:00'
          calendar = @ong.ong_calendars.find_or_create_by(day: day)
          calendar.start_time = params[day][:inicio]
          calendar.end_time = params[day][:hasta]
          calendar.start_time_differential = params[day][:inicio_cortado]
          calendar.end_time_differental = params[day][:hasta_cortado]
          calendar.day = day
          calendar.save
        else
          # if not set all days params but we select the same
          # hours for the selected days
          calendar = @ong.ong_calendars.find_or_create_by(day: day)
          calendar.start_time = params[:ALL][:inicio]
          calendar.end_time = params[:ALL][:hasta]
          calendar.start_time_differential = params[:ALL][:inicio_cortado]
          calendar.end_time_differental = params[:ALL][:hasta_cortado]
          calendar.day = day
          calendar.save
        end
      end
    end

    ong_detail = @ong.ong_detail
    ong_detail.beds = params[:camas]
    ong_detail.timelapse = params[:duracion]
    ong_detail.save

    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'Calendario guardado' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_ong
    @ong = Ong.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def ong_params
    params.require(:ong).permit(:name, :address, :address2, :city, :addressState,
                                :country, :zip, :country, :phone, :adminEmail,
                                :websiteUrl, :facebookPage, :nationalNetworkName,
                                :internationalNetworkName, :comments)
  end
end
