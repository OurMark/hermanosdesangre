class OngsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_ong, only: [:show, :edit, :bookings]

  # GET /ongs
  # GET /ongs.json
  def index
    @ongs = Ong.recent(10)
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
    @ong.build_ong_detail
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
  end

  def calendar
      @ong = Ong.find(params[:ong_id])
      @days = ['LU', 'MA', 'MI' , 'JU', 'VI', 'SA', 'DO']
      @intervalo_horario = []
    (00..23).each {|hour|
        ['00', '30'].each {|minutes|
         @intervalo_horario.append(hour.to_s + ':' + minutes)
         }
     }
      @duracion_turnos = ['30', '45', '60']
  end

  def save_calendar
    @days = [:LU, :MA, :MI, :JU, :VI, :SA, :DO]
    logger.info 'Find ong'
    @ong = Ong.find(params[:ong_id])
    # @ong.ong_detail.update(beds: params[:camas], timelapse: params[:duracion])
    @days.each { |day|
      logger.info 'Find or create day #{day}'
      calendar = @ong.ong_calendars.find_or_create_by(day: day)

      calendar.start_time = params[day][:inicio]
      calendar.end_time = params[day][:hasta]
      calendar.day = day
      calendar.save
    }
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
