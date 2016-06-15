class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params
  layout 'static-two', only: [:new]

  def new
    resource = build_resource({})
    resource.build_user_detail
    resource.build_user_locale
    respond_with resource
  end

  private

  def sign_up_params
    allow = [:name, :surname, :birthDate, :gender, :city, :state, :country,
      :username, :password, :password_confirmation,
      user_detail_attributes: [:dni, :bloodtype],
      user_locale_attributes: [:city, :country, :state]]
    params.require(resource_name).permit(allow)
  end

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:name, :surname,
      :birthDate, :gender, :city, :state, :country,
      :username, :current_password,
      user_detail_attributes: [:dni, :bloodtype],
      user_locale_attributes: [:city, :country, :state, :id])}
  end
end
