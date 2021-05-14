require 'rails_helper'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock

  secrets = [
    %i[lastfm api_key], %i[vk page_id], %i[vk email],
    %i[vk password], %i[discogs api_key], %i[discogs api_secret],
    %i[soundcloud api_key], %i[soundcloud test_v2_client_id],
    %i[deezer test_track_token], %i[deezer test_api_token],
    %i[deezer test_license_token], %i[youtube api_key],
    %i[google api_key], %i[google scopes lastfm_tags],
    %i[google scopes bandcamp_albums],
    %i[google scopes bandcamp_artists],
    %i[google scopes bandcamp_tracks],
    %i[yandex email], %i[yandex password], %i[yandex csrf_token],
    %i[odnoklassniki email], %i[odnoklassniki password],
    %i[odnoklassniki test_session_id], %i[deezer test_track_token],
    %i[deezer test_api_token], %i[deezer test_license_token]
  ]

  secrets.each do |keys|
    filter_name = "<#{keys.join('_').upcase}>"
    filter_value = CGI.escape(
      Rails.application.credentials.dig(*keys).to_s
    )

    c.filter_sensitive_data(filter_name) { filter_value }
  end
end
