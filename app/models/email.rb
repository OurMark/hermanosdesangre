class Email < ActiveRecord::Base
  self.table_name = 'email'
  has_one :user_email, foreign_key: :emails_email_id
  has_one :user, through: :user_email
end
