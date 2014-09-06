class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :ongs
  has_many :challenges, through: :ongs
  has_and_belongs_to_many :bookings
  has_and_belongs_to_many :badges
  validates_presence_of :first_name
end
