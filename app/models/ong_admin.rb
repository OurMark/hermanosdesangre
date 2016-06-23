class OngAdmin < ActiveRecord::Base
  belongs_to :user, foreign_key: :admins_user_id
  belongs_to :ong, foreign_key: :ong_ong_id
end
