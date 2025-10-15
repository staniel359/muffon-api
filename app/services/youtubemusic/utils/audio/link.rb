module YouTubeMusic
  module Utils
    module Audio
      class Link < YouTubeMusic::Base
        FILE_EXTENSION = 'opus'.freeze

        include Muffon::Utils::Audio::Link

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track_id
          ]
        end

        def write_audio_data_to_file
          return if test?

          `yt-dlp \
            #{@args[:track_id]} \
            --extract-audio \
            --output public/#{audio_path_without_extension}
          `
        end
      end
    end
  end
end
