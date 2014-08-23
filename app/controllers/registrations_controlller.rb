class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :birth, :bloodtype, :dni, :gender, :city, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:first_name, :birth, :bloodtype, :dni, :gender, :city, :email, :password, :password_confirmation, :current_password)
    end
  end
end