module VK
  module Utils
    module Audio
      class Converter < VK::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:file_path]]
        end

        def data
          `ffmpeg -loglevel panic -y \
            -i #{file_path}.ts \
            -c copy #{file_path}.mp3`
        end

        def file_path
          @args[:file_path]
        end
      end
    end
  end
end
