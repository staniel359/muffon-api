module Spotify
  module Utils
    module Audio
      class Link < Spotify::Base
        FILE_EXTENSION = 'm4a'.freeze

        include Muffon::Utils::Audio::Link

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          false
        end

        # def audio_binary_data
        #   @audio_binary_data ||=
        #     Spotify::Utils::Audio::Decrypter.call(
        #       track_id: @args[:track_id]
        #     )
        # end

        def write_audio_data_to_file
          `spotify-web-downloader \
            https://open.spotify.com/track/#{@args[:track_id]} \
            --cookies-path ./spotify_cookies.txt \
            --output-path public/#{audio_folder} \
            --print-exceptions \
            --overwrite \
            --no-lrc \
            --template-folder-album '' \
            --template-file-single-disc #{@args[:track_id]} \
            --template-folder-compilation ''`
        end
      end
    end
  end
end
