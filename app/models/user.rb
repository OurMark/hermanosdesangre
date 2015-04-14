class User < ActiveRecord::Base
  self.table_name = 'user'

  has_many :user_email, foreign_key: :user_user_id
  has_many :addresses, through: :user_email
  has_one :role, foreign_key: :OMUser_user_id
  has_one :user_config
  has_many :exchanged_codes
  has_one :user_detail
  has_one :user_locale
  has_many :user_badges
  has_many :badges, through: :user_badges
  accepts_nested_attributes_for :user_locale
  accepts_nested_attributes_for :user_detail

  has_many :ong_admins, foreign_key: :admins_user_id
  has_many :ongs, through: :ong_admins, foreign_key: :ong_ong_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  alias_attribute :email, :username
end
