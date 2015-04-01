class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
    end
  end
end
