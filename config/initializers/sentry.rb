return unless Rails.env.production?

Sentry.init do |config|
  credentials =
    Rails
    .application
    .credentials

  config.dsn =
    credentials.dig(
      :sentry,
      :url
    )

  config.data_collection.user_info = false

  config
    .rails
    .structured_logging
    .enabled = true
end
