class CreateOngDetails < ActiveRecord::Migration
  def change
    create_table :ong_details do |t|
      t.references :ong
      t.integer :beds
      t.integer :timelapse
    end
  end
end
