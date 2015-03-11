module OngsHelper
  def set_time(hour, minutes)
    Time.new(params[:year], params[:month], params[:day], hour, minutes, 0, "+00:00")
  end

  def available_turns(turnos, hora)
    turnos.select{ |t| t.start_time == hora } || []
  end
end
