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
    %i[deezer test_license_token],
    %i[google api_key],
    %i[google scopes bandcamp_albums],
    %i[google scopes bandcamp_artists],
    %i[google scopes bandcamp_tracks]
  ]

  keys.each do |arr|
    filter_name = "<#{arr.join('_').upcase}>"
    value = Rails.application.credentials.dig(*arr)

    c.filter_sensitive_data(filter_name) do
      CGI.escape(value.to_s)
    end
  end
end
