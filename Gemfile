source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

gem 'rails'
gem 'pg'
gem 'puma'
gem 'redis'
gem 'rack-cors'
gem 'rest-client'
gem 'nokogiri'
gem 'bootsnap', require: false

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
  gem 'pry'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'rspec-rails'
  gem 'vcr'
  gem 'webmock'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
