class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  has_many :ong_admins
  belongs_to :user
  has_one :ong_detail

  def user_is_admin?(user)
    user.ongs.include?(self)
  end

  def beds
    ong_detail.beds
  end

  def timelapse
    ong_detail.timelapse
  end
end
