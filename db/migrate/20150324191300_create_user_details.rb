class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.references :user
      t.string :dni
      t.string :bloodtype
    end
  end
end
