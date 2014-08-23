class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.string :value
      t.string :icon
      t.string :description

      t.timestamps
    end
  end
end
