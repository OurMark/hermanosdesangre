class UsersController < ApplicationController
  layout 'myaccount'
  def show
  	@next_bookings = current_user.bookings.most_near
  	@last_booking  = current_user.bookings.last_done.first
  end
end
