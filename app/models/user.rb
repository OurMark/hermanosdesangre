class User < ActiveRecord::Base
  self.table_name = 'user'

  has_many :user_email, foreign_key: :user_user_id
  has_many :addresses, through: :user_email
  has_one :role, foreign_key: :OMUser_user_id
  has_one :user_config
  has_many :exchanged_codes

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

  def email
    self.username
  end
end
