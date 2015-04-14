require_relative './concerns/bookable'

class Booking < ActiveRecord::Base
  has_and_belongs_to_many :users
end