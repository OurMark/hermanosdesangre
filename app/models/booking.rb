class Booking < ActiveRecord::Base
  belongs_to :ong
  belongs_to :user
  scope :most_near, -> {where("date >= ?", Date.today)}
  scope :last_done, -> {where("date <= ?", Date.today).order("date desc")}

end
