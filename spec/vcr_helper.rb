SECRET_KEYS = [
  %i[
    amazon_music
    client_id
  ],
  %i[
    amazon_music
    client_secret
  ],
  %i[
    amazon_music
    refresh_token
  ],
  %i[
    amazon_music
    cookies
    ubid_acbuk
  ],
  %i[
    amazon_music
    cookies
    at_acbuk
  ],
  %i[
    deezer
    api_token
  ],
  %i[
    deezer
    license_token
  ],
  %i[
    deezer
    track_token
  ],
  %i[
    deezer
    session_id
  ],
  %i[
    discogs
    api_key
  ],
  %i[
    discogs
    api_secret
  ],
  %i[
    github
    token
  ],
  %i[
    google
    api_key
  ],
  %i[
    google
    scopes
    lastfm_tags
  ],
  %i[
    lastfm
    api_key
  ],
  %i[
    musixmatch
    api_key
  ],
  %i[
    odnoklassniki
    email
  ],
  %i[
    odnoklassniki
    password
  ],
  %i[
    odnoklassniki
    test_session_id
  ],
  %i[
    soundcloud
    api_key
  ],
  %i[
    soundcloud
    test_access_token
  ],
  %i[
    soundcloud
    test_v2_client_id
  ],
  %i[
    spotify
    token
  ],
  %i[
    spotify
    cookies
    sp_dc
  ],
  %i[
    vk
    access_token
  ]
].freeze

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'

  config.hook_into :webmock

  SECRET_KEYS.each do |keys|
    filter_name =
      "<#{keys.join('_').upcase}>"

    credentials =
      Rails
      .application
      .credentials

    filter_value =
      credentials
      .dig(
        *keys
      )
      .to_s

    filter_value_escaped =
      CGI.escape(
        filter_value
      )

    config.filter_sensitive_data(
      filter_name
    ) do
      filter_value_escaped
    end

    config.filter_sensitive_data(
      filter_name
    ) do
      filter_value
    end
  end
end
