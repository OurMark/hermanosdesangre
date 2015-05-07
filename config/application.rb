require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'susy'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bloodbrothers
  class Application < Rails::Application
    config.assets.precompile += ['style.css']
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
