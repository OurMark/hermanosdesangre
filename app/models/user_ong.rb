class UserOng < ActiveRecord::Base
  has_many :users
  has_many :ongs
end