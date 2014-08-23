class CreateJoinTableUserBooking < ActiveRecord::Migration
  def change
    create_join_table :users, :bookings do |t|
      # t.index [:user_id, :booking_id]
      # t.index [:booking_id, :user_id]
    end
  end
end
