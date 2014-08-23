class Ong < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :challenges
  has_many :bookings
end
