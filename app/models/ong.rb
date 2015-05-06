class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  has_many :ong_admins
  belongs_to :user

  def user_is_admin?(user)
    user.ongs.include?(self)
  end
end
