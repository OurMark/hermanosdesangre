class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :ongs
  has_many :challenges, through: :ongs
  has_and_belongs_to_many :bookings
  has_and_belongs_to_many :badges

  validates :bloodtype, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :birth, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
end
