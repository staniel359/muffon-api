return if Rails.env.test?

require 'sqlite3'

BROWSER_COOKIES_DATABASE =
  SQLite3::Database.new(
    Rails.application.credentials[:browser_cookies_path]
  )
