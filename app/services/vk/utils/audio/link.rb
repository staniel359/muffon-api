module VK
  module Utils
    module Audio
      class Link < VK::Base
        FILE_EXTENSION = 'mp3'.freeze

        include Muffon::Utils::Audio::Link

        def call
          check_args

          data
        end

        private

        def required_args
          %i[
            track_id
            link
          ]
        end

        def write_audio_data_to_file
          return if test?

          `ffmpeg \
            -http_persistent false \
            -i #{@args[:link]} \
            -y \
            -movflags +faststart \
            -c copy \
            -loglevel error \
            public/#{audio_path}`
        end
      end
    end
  end
end
