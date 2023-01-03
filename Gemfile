source 'https://rubygems.org'

git_source(:github) do |repo|
  "https://github.com/#{repo}.git"
end

ruby File.read(
  '.ruby-version'
).strip

gem 'bootsnap', require: false
gem 'bcrypt'
gem 'image_processing'
gem 'mini_magick'
gem 'nokogiri', '1.14.0.rc1'
gem 'parallel'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails'
gem 'redis'
gem 'rest-client'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'sidekiq', '<7'
gem 'sidekiq-limit_fetch'
gem 'whenever', require: false

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano3-puma', require: false
  gem 'debug'
  gem 'listen'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'rspec-rails'
  gem 'vcr'
  gem 'webmock'
end

