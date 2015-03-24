class CreateUserBadge < ActiveRecord::Migration
  def change
    create_table :badges_user do |t|
      t.references :user, index: true
      t.references :badge, index: true
    end
  end
end
