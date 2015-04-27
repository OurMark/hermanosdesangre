class CreateUserBadge < ActiveRecord::Migration
  def change
    rename_index :topic, 'name', 'topic_name'
    create_table :user_badges do |t|
      t.references :user, index: true
      t.references :badge, index: true
    end
  end
end
