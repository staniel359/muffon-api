module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        BASE_LINK =
          'https://spclient.wg.spotify.com'.freeze
        FILE_EXTENSION = 'm4a'.freeze

        include Muffon::Utils::Audio::Link

        def call
          check_args

          return if no_data?

          data
        rescue Faraday::UnauthorizedError
          retry_with_new_spotify_audio_token
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
              track_id: @args[:track_id]
            )
        end

        def file_data
          @file_data ||=
            Spotify::Utils::Audio::Link::File.call(
              track_data:
            )
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
              track_id: @args[:track_id],
              file_id:
            )
        end

        def file_id
          file_data['fileid']
        end

        def data
          create_audio_folder

          (retrieve_audio && audio_link).presence
        end

        def retrieve_audio
          return true if test?

          system(
            "ffmpeg \
              -decryption_key #{key} \
              -i #{file_link} \
              -y \
              -movflags +faststart \
              -c copy \
              -loglevel error \
              public/#{audio_path}"
          )
        end

        def file_link
          file_data['cdnurl'].sample
        end

        alias spotify_token spotify_audio_token
      end
    end
  end
end
