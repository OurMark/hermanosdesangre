class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  has_many :ong_admins
  has_many :ong_admins, foreign_key: :ong_ong_id
  has_many :users, through: :ong_admins, foreign_key: :admins_user_id
  has_one :ong_detail
  has_many :ong_calendars

  self.inheritance_column = :_type_disabled

  scope :recent, ->(num) { order('ong_id').limit(num) }

  def user_is_admin?(user)
    user.ongs.include?(self)
  end

  def beds
    ong_detail.beds
  end

  def timelapse
    ong_detail.timelapse
  end

  def check_calendar_day(day)
    ong_calendars.find_by_day(day)
    false
  end
end
