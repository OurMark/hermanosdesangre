class StaticController < ApplicationController
  layout :set_layout

  def home
  end

  def about_us
  end

  def contact
  end

  def information
  end

  def campaign
  end

  def objective
  end

  def donors
  end

  private
  ##
  # defines layout for the controller
  # depends on controller action
  def set_layout
    case action_name
    when 'home'
      'application'
    else
      'static'
    end
  end
end
