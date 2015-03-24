class UserLocale < ActiveRecord::Base
  self.table_name = "user_locale"
  belongs_to :user
end
