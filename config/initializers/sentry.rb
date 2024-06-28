return unless Rails.env.production?

Sentry.init do |config|
  config.dsn =
    Rails
      .application
      .credentials
      .sentry
      .url
end
