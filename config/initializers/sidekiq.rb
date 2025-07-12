Sidekiq.strict_args!

Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.logger.level = Logger::WARN
  end

  Rails.logger = Sidekiq.logger

  ActiveRecord::Base.logger = Sidekiq.logger

  ActiveJob::Base.logger = Sidekiq.logger
end
