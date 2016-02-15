class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :ong_id
      t.time :start_time
      t.time :end_time
      t.integer :length
      t.string :dni

      t.timestamps
    end
  end
end
