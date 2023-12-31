module Spotify
  module Utils
    module Audio
      class Decrypter < Spotify::Base
        BASE_LINK =
          'https://spclient.wg.spotify.com'.freeze

        def call
          return if not_all_args? || no_data?

          data
        rescue Faraday::ResourceNotFound
          nil
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          track_data.blank? ||
            file_data.blank? ||
            key.blank?
        end

        def track_data
          @track_data ||=
            Spotify::Utils::Audio::Decrypter::Track.call(
              global_id:
            )
        end

        def global_id
          @global_id ||=
            Spotify::Utils::Audio::Decrypter::GlobalId.call(
              track_id: @args[:track_id]
            )
        end

        def file_data
          @file_data ||=
            Spotify::Utils::Audio::Decrypter::File.call(
              track_data:
            )
        end

        def headers
          {
            'Authorization' =>
              "Bearer #{token}"
          }
        end

        def token
          @token ||=
            Spotify::Utils::Audio::Decrypter::Token.call
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
            Spotify::Utils::Audio::Decrypter::Key.call(
              global_id:,
              file_id:
            )
        end

        def file_id
          file_data['fileid']
        end

        def data
          Spotify::Utils::Audio::Decrypter::Binary.call(
            file_link:,
            key:
          )
        end

        def file_link
          file_data.dig(
            'cdnurl', 0
          )
        end
      end
    end
  end
end
