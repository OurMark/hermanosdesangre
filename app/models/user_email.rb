class UserEmail < ActiveRecord::Base
  self.table_name = 'user_email'
  belongs_to :address, class_name: 'Email', foreign_key: :user_user_id
  belongs_to :user, class_name: 'User', foreign_key: :emails_email_id
end