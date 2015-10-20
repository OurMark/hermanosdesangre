class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  has_many :ong_admins
  has_many :ong_admins, foreign_key: :ong_ong_id
  has_many :users, through: :ong_admins, foreign_key: :admins_user_id
  has_one :ong_detail

  self.inheritance_column = :_type_disabled

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
