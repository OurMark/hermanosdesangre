class AddUserToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :user, index: true
  end
end
