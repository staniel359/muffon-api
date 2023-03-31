Sidekiq.strict_args!

Sidekiq.configure_server do |config|
  config.logger.level = Logger::WARN

  Rails.logger = Sidekiq.logger
  ActiveRecord::Base.logger = Sidekiq.logger
  ActiveJob::Base.logger = Sidekiq.logger
end
