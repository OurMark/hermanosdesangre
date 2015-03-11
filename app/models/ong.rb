class Ong < ActiveRecord::Base
  belongs_to :user
  has_many :challenges
  has_many :bookings

  def user_is_admin?(user)
    user.ongs.include?(self)
  end
end
