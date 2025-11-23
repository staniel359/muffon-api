require_relative "boot"
require_relative "../lib/spotify/spotify_pb"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
# require "action_view/railtie"
require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MuffonAPI
  class Application < Rails::Application
    def credentials
      @credentials ||=
        JSON
          .load_file(
            credentials_file_path
          )
          .deep_symbolize_keys
    end

    def credentials_file_path
      Rails
        .root
        .join(
          "config/credentials/#{Rails.env}.json"
        )
    end

    def secret_key_base
      credentials[:secret_key_base]
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.railties_order = [
      ActiveStorage::Engine,
      :all
    ]

    config
      .action_mailer
      .delivery_method = :smtp

    config
      .action_mailer
      .smtp_settings = {
        address: 'smtp.gmail.com',
        port: 587,
        domain: 'gmail.com',
        user_name:
          credentials.dig(
            :mailer,
            :email
          ),
        password:
          credentials.dig(
            :mailer,
            :password
          ),
        authentication: :login,
        openssl_verify_mode: 'none'
      }

    config
      .action_mailer
      .deliver_later_queue_name = 'profile_mailer'

    config
      .active_storage
      .queues
      .analysis = :storage_analysis

    config
      .active_storage
      .queues
      .purge = :storage_purge

    config.to_prepare do
      ActiveStorage::AnalyzeJob.class_eval do
        def perform(blob)
          blob.analyze
        rescue *[
          ActiveStorage::FileNotFoundError,
          Aws::S3::Errors::NotFound,
          Aws::S3::Errors::NoSuchKey,
          Aws::S3::Errors::Http500Error
        ]
          nil
        end
      end

      ActiveStorage::PurgeJob.class_eval do
        def perform(blob)
          blob.purge
        rescue *[
          Aws::S3::Errors::InternalError
        ]
          nil
        end
      end
    end

    config.session_store(
      :cookie_store,
      key: "_muffon_api_session"
    )

    config
      .middleware
      .use(
        ActionDispatch::Cookies
      )

    config
      .middleware
      .use(
        config.session_store,
        config.session_options
      )

    config
      .active_storage
      .variant_processor = :mini_magick

    config
      .action_controller
      .wrap_parameters_by_default = false
  end
end
