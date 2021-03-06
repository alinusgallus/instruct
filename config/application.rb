require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Instruct
  class Application < Rails::Application

    config.time_zone = 'Singapore'
    # Only for active_record
    config.active_record.default_timezone = :local
    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    #Try to configure sass
    config.sass.preferred_syntax = :sass
    config.sass.line_comments = false
    config.sass.cache = false

    
    # Configure default generators
    config.generators do |g|
    g.helper false
    g.stylesheets false
    g.javascripts false
    
end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
