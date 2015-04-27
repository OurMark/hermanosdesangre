class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_user_info, except: [:edit]
  before_filter :set_user_relations

  protected

  def check_user_info
    redirect_to edit_user_registration_path unless current_user.valid?
  end

  def set_user_relations
    if current_user
      @badges = current_user.badges
      #@ongs = current_user.ongs
    end
  end
end
