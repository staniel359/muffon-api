module VK
  module Utils
    module Audio
      class Link < VK::Base
        FILE_EXTENSION = 'mp3'.freeze

        include Muffon::Utils::Audio::Link

        private

        def primary_args
          [
            @args[:track_id],
            @args[:link]
          ]
        end

        def no_data?
          false
        end

        def write_audio_data_to_file
          return if test?

          `ffmpeg \
            -http_persistent false \
            -i #{link} \
            -y \
            -movflags +faststart \
            -c copy \
            -loglevel error \
            public/#{audio_path}`
        end

        def link
          @args[:link]
        end
      end
    end
  end
end
