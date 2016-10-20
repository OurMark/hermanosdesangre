require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
# Bundler.require(*Rails.groups)

if defined?(Bundler)
	# If you precompile assets before deploying to production, use this line
	Bundler.require(*Rails.groups(:assets => %w(development test)))
	# If you want your assets lazily compiled in production, use this line
	# Bundler.require(:default, :assets, Rails.env)
end

module Bloodbrothers
  class Application < Rails::Application
	# Enable the asset pipeline
	config.assets.enabled = true

	# Version of your assets, change this if you want to expire all your assets
	config.assets.version = '1.05'
    config.assets.precompile += ['style.css','jquery-ui.min.css', 'fullcalendar.css', 'fullcalendar.print.css', 'bookings.js']
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
