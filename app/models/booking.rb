class Booking < ActiveRecord::Base
  belongs_to :ong
  belongs_to :user
  scope :most_near, -> {where("date >= ?", Date.today)}
  scope :last_done, -> {where("date <= ?", Date.today).order("date desc")}

  def date_start
  	"#{date.strftime('%d %B, %Y')} #{(start_at).strftime('%H:%M')}"
  end

  def date_end
    "#{date.strftime('%d %B, %Y')} #{(start_at + (length.try(:minutes) || self.ong.timelapse.minutes)).strftime('%H:%M')}"
  end
end
