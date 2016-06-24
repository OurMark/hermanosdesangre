class Ong < ActiveRecord::Base
  self.table_name = 'ong'
  # This constant is to set the topic id for Blood Donation topic.
  # Every ONG which is a blood bank has 'tagged' with the Blood Donation Topic
  TOPIC_ID = 5 # BLOOD_DONATION
  has_many :ong_admins
  has_many :ong_admins, foreign_key: :ong_ong_id
  has_many :users, through: :ong_admins, foreign_key: :admins_user_id
  has_one :ong_detail
  has_many :ong_calendars
  has_and_belongs_to_many :topics, :join_table => :ong_topic
  has_many :bookings

  self.inheritance_column = :_type_disabled

  default_scope {includes(:topics).where(topic: {topic_id:  TOPIC_ID})}
  scope :limited_to, ->(num) { order('ong_id').limit(num) }
  scope :has_detail, -> { includes(:ong_detail).where.not(ong_details: {:id => nil})}
  scope :has_calendar, -> { includes(:ong_calendars).where.not(ong_calendars: {:id => nil})}

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

  def has_calendar?
    !self.ong_calendars.nil?
  end

  def has_details?
    !self.ong_detail.nil?
  end
  
  private

  def add_topic
    topic = Topic.find_by name: 'BLOOD_DONATION'
    topics << topic
    save
  end
end
