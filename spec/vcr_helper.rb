require 'rails_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  keys = [
    %i[lastfm api_key],
    %i[youtube api_key],
    %i[vk page_id],
    %i[vk email],
    %i[vk password],
    %i[discogs api_key],
    %i[discogs api_secret],
    %i[spotify api_key],
    %i[soundcloud api_key],
    %i[deezer test_track_token],
    %i[deezer test_api_token],
    %i[deezer test_license_token]
  ]

  keys.each do |arr|
    filter_name = "<#{arr[0]}_#{arr[1]}>".upcase
    value = Rails.application.credentials.dig(arr[0], arr[1])

    c.filter_sensitive_data(filter_name) do
      CGI.escape(value.to_s)
    end
  end
end
