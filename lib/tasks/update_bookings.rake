desc "Update User id with the correct Booking."
task :update_user_into_bookings => :environment do 
  Booking.all.each do |booking|
    user_detail = UserDetail.where({dni: booking.dni}).first 
    if user_detail && user_detail.user_id
      puts "** Updating Booking # #{booking.id} ..."
      booking.update_attributes({user_id: user_detail.user_id})
    end
  end
  puts "End."
end

desc "Remove Bookings without dni or user_id associated."
task :remove_bad_bookins => :environment do
  Booking.where({user_id: nil, dni: ''}).each do |booking|
    puts "Destroy Booking ##{booking.id} without user_id and dni associated..."
    booking.destroy
  end
  puts "End."
end