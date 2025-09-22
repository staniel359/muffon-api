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

  config.send_default_pii = true
end
