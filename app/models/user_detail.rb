class UserDetail < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :dni
  validates_presence_of :bloodtype
end
