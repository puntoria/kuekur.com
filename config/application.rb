require_relative 'boot'
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
Bundler.require(*Rails.groups)

module Kuekur
  class Application < Rails::Application
    config.assets.quiet = true
    config.generators do |generate|
      generate.helper false
      generate.javascripts false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.action_controller.action_on_unpermitted_parameters = :raise

    config.autoload_paths << "#{Rails.root}/app/services"

    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

    config.action_dispatch.default_headers = {
      'X-Frame-Options' => 'ALLOWALL'
    }
  end
end
