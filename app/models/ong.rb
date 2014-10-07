class Ong < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :challenges
  has_many :bookings

  def user_is_admin?(user)
    user.ongs.include?(self)
  end
end
