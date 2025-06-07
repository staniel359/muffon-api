module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        BASE_LINK =
          'https://spclient.wg.spotify.com'.freeze
        FILE_EXTENSION = 'ogg'.freeze

        include Muffon::Utils::Audio::Link

        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [
            @args[:track_id],
            @args[:client_version]
          ]
        end

        def no_data?
          track_data.blank? ||
            file_data.blank? ||
            key.blank?
        end

        def track_data
          @track_data ||=
            Spotify::Utils::Audio::Link::Track.call(
              track_id:
            )
        end

        def track_id
          @args[:track_id]
        end

        def file_data
          @file_data ||=
            Spotify::Utils::Audio::Link::File.call(
              track_data:
            )
        end

        def spotify_token
          return test_token if test?

          @spotify_token ||=
            Spotify::Utils::Audio::Link::Token.call
        end

        def test_token
          'BQCEIITz-wAyQhs4Wz-8uQNKD9CnN30yIKNj04G8' \
            '-HrHgZIeMNQOc7njflVNWQrsefB7qhXNwKcnFQbH' \
            'ZbK4vCID58eq3uILIahKI1DGLMGeDqkW7cehj444' \
            'GWzaV8qbh-YvBOrOCC7e6MppIMiqXyEBfWE4qNbj' \
            'viLA0oKbmxl7DgCn-yfVZpwM2OXj1ghq8nEpotTH' \
            'bQMMmMD8_8Qn383FwQNveNGxJNMSNdRzaKetOnZa' \
            'RPZ4MfcENBBZgIeZwiaiS_DpSIePB2Bw2cmTZJY4' \
            'v2ptNlX-z-XEjwzwPxPwQ8wlHSl-LaKHRcLw4PhB' \
            'BSJwNbm9QLytbBx6Yngjm5VT'
        end

        def params
          {
            version: 10_000_000,
            product: 9,
            platform: 39,
            alt: 'json'
          }
        end

        def key
          @key ||=
            Spotify::Utils::Audio::Link::Key.call(
              track_id:,
              file_id:,
              client_version:
            )
        end

        def file_id
          file_data['fileid']
        end

        def audio_binary_data
          Spotify::Utils::Audio::Link::Decrypter::Binary.call(
            file_link:,
            key:
          )
        end

        def file_link
          file_data['cdnurl'].sample
        end
      end
    end
  end
end
