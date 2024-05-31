Sidekiq.strict_args!

Sidekiq.configure_server do |config|
  config.logger.level = Logger::WARN

  Rails.logger = Sidekiq.logger

  ActiveRecord::Base.logger = Sidekiq.logger

  ActiveJob::Base.logger = Sidekiq.logger

  config.redis = {
    network_timeout: 5,
    pool_timeout: 5
  }
end
