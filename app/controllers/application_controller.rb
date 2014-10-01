class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_user_relations
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,
      :last_name, :birth, :bloodtype, :dni, :gender, :city, :state, :country,
      :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,
      :last_name, :birth, :bloodtype, :dni, :gender, :city, :state, :country,
      :email, :password, :password_confirmation, :current_password) }
  end

  def set_user_relations
    if current_user
      @badges = current_user.badges
      @ongs = current_user.ongs
    end
  end
end
