source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.0.1'

gem 'bootsnap', require: false
gem 'nokogiri'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'rails'
gem 'redis'
gem 'rest-client'
gem 'sentry-rails'
gem 'sentry-ruby'
gem 'whenever', require: false

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-puma', require: false
  gem 'listen'
  gem 'pry'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'vcr'
  gem 'webmock'
end

