class Booking < ActiveRecord::Base
  belongs_to :ong
  belongs_to :user
end
