if Rails.env.production?
  Sentry.init do |config|
    config.dsn =
      'https://496bf93eb9d848348ee26c94fc717336'\
      '@o563575.ingest.sentry.io/5755700'
  end
end
