class CreateJoinTableUserOng < ActiveRecord::Migration
  def change
    create_join_table :users, :ongs do |t|
      t.belongs_to :user
      t.belongs_to :ong
    end
  end
end
