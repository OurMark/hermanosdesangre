class AddStartAtToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :start_at, :datetime
  end
end
