SECRET_KEYS = [
  %i[deezer api_token],
  %i[deezer license_token],
  %i[deezer track_token],
  %i[deezer session_id],
  %i[discogs api_key],
  %i[discogs api_secret],
  %i[github token],
  %i[google api_key],
  %i[google scopes lastfm_tags],
  %i[lastfm api_key],
  %i[musixmatch api_key],
  %i[odnoklassniki email],
  %i[odnoklassniki password],
  %i[odnoklassniki test_session_id],
  %i[soundcloud api_key],
  %i[soundcloud test_access_token],
  %i[soundcloud test_v2_client_id],
  %i[spotify token],
  %i[spotify cookies sp_dc],
  %i[vk access_token]
].freeze

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock

  SECRET_KEYS.each do |keys|
    filter_name = "<#{keys.join('_').upcase}>"
    filter_value = CGI.escape(
      Rails.application.credentials.dig(*keys).to_s
    )

    config.filter_sensitive_data(filter_name) do
      filter_value
    end
  end
end
