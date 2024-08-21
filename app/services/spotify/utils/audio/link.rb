module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        BASE_LINK =
          'https://spclient.wg.spotify.com'.freeze
        FILE_EXTENSION = 'm4a'.freeze

        include Muffon::Utils::Audio::Link

        def call
          return if not_all_args? || no_data?

          data
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
            Spotify::Utils::Audio::Link::Track.call(
              global_id:
            )
        end

        def global_id
          @global_id ||=
            Spotify::Utils::Audio::Link::GlobalId.call(
              track_id: @args[:track_id]
            )
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
              global_id:,
              file_id:
            )
        end

        def file_id
          file_data['fileid']
        end

        def write_audio_data_to_file
          `ffmpeg \
            -decryption_key #{key} \
            -i #{file_link} \
            -y \
            -loglevel panic \
            public/#{audio_path}`
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
