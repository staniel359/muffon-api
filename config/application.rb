require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'active_job/railtie'
require 'action_cable/engine'

# require 'active_storage/engine'
# require 'action_text/engine'

Bundler.require(*Rails.groups)

module MuffonAPI
  class Application < Rails::Application
    config.load_defaults 6.0

    config.api_only = true

    config.autoload_paths << Rails.root.join('app/services/')

    config.generators do |c|
      c.request_specs(false)
      c.controller_specs(true)
      c.skip_routes(true)
    end

    config.filter_parameters += [:password]
  end
end
