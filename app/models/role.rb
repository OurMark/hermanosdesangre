class Role < ActiveRecord::Base
  self.table_name = 'OMUser_roles'
  belongs_to :user, foreign_key: :OMUser_user_id
end
