return if Rails.env.test?

require 'sqlite3'

credentials = Rails.application.credentials

browser_profile_path =
  credentials.dig(
    :browser,
    :profile_path
  )

cookies_file_path = '/cookies.sqlite'

cookies_file_full_path =
  "#{browser_profile_path}#{cookies_file_path}"

BROWSER_COOKIES_DATABASE =
  SQLite3::Database.new(
    cookies_file_full_path
  )
