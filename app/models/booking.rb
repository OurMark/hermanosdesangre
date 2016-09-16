class Booking < ActiveRecord::Base
  belongs_to :ong
  belongs_to :user

  scope :most_near, -> {where("day >= ?", Date.today)}
  scope :last_done, -> {where("day <= ?", Date.today).order("day desc")}
end
