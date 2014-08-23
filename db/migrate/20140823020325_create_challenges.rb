class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.references :ong, index: true
      t.integer :objective
      t.integer :progress
      t.boolean :active
      t.date :start
      t.date :end
      t.date 

      t.timestamps
    end
  end
end
