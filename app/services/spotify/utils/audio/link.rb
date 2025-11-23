module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        BASE_LINK =
          'https://gew1-spclient.spotify.com:443'.freeze
        FILE_EXTENSION = 'ogg'.freeze

        include Muffon::Utils::Audio::Link

        def call
          check_args

          return if no_data?

          data
        end

        private

        def required_args
          %i[
            track_id
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
          @spotify_token ||=
            Spotify::Utils::Audio::Link::Token.call
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
              file_id:
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
