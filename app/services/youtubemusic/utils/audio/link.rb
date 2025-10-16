module YouTubeMusic
  module Utils
    module Audio
      class Link < YouTubeMusic::Base
        FILE_EXTENSION = 'm4a'.freeze

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

          `python3.12 \
            lib/youtubemusic/audio_downloader.py \
            --video_id #{@args[:track_id]} \
            --output_path public/#{audio_folder} \
            --file_name #{audio_file_name_with_extension}
          `
        end
      end
    end
  end
end
