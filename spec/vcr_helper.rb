require 'rails_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  keys = [
    %w[lastfm api_key],
    %w[youtube api_key],
    %w[vk page_id],
    %w[vk email],
    %w[vk password],
    %w[discogs api_key],
    %w[discogs api_secret],
    %w[spotify api_key],
    %w[soundcloud api_key]
  ]

  keys.each do |a|
    filter_name = "<#{a[0]}_#{a[1]}>".upcase
    value = Rails.application.credentials.send(a[0])[a[1].to_sym]
    c.filter_sensitive_data(filter_name) { CGI.escape(value.to_s) }
  end
end
