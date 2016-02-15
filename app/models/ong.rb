class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  has_many :ong_admins
  has_many :ong_admins, foreign_key: :ong_ong_id
  has_many :users, through: :ong_admins, foreign_key: :admins_user_id
  has_one :ong_detail
  has_many :ong_calendars
  has_and_belongs_to_many :topics, :join_table => :ong_topic

  self.inheritance_column = :_type_disabled

  scope :limited_to, ->(num) { order('ong_id').limit(num) }
  scope :blood_donation, -> {includes(:topics).where("topic.name = ? ", 'BLOOD_DONATION')}

  after_create :add_topic

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

  def has_calendar()
    
  end

  def has_details?()
    ong_detail.present?
  end
  
  private

  def add_topic
    topic = Topic.find_by name: 'BLOOD_DONATION'
    topics << topic
    save
  end
end
