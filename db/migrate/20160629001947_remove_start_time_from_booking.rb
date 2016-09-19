class RemoveStartTimeFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :start_time, :time
  end
end
