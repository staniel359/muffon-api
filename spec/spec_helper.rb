ENV['RAILS_ENV'] ||= 'test'

require File.expand_path(
  '../config/environment', __dir__
)

require 'rspec/rails'
require 'vcr'
require 'vcr_helper'

Dir[
  Rails.root.join(
    'spec/helpers/**/*.rb'
  )
].each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.shared_context 'shared' do
  let(:random) do
    Helpers::Base::RANDOM_STRING
  end
end

RSpec.configure do |config|
  config.include_context 'shared'

  config.filter_rails_from_backtrace!
end

