class AddDayToBookings < ActiveRecord::Migration
  def change
  	add_column :bookings, :day, :date
  end
end
