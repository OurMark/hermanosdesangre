class Topic < ActiveRecord::Base
	self.table_name = 'topic'
	has_and_belongs_to_many :ongs, :join_table => :ong_topic

	scope :blood_donation, -> {where('name = ?', 'BLOOD_DONATION')}
end
