Sidekiq.strict_args!

Sidekiq.configure_server do |config|
  config.logger.level = :warn
end
