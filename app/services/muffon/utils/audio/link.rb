module Muffon
  module Utils
    module Audio
      module Link
        private

        def create_audio_folder
          return if test?

          FileUtils.mkdir_p(
            "public/#{audio_folder}"
          )
        end

        def audio_folder
          "media/audio/#{source_name}"
        end

        def audio_link
          "#{credentials[:url]}/#{audio_path}"
        end

        def audio_path
          "#{audio_folder}/#{audio_file_name_with_extension}"
        end

        def audio_file_name_with_extension
          "#{audio_file_name}.#{file_extension}"
        end

        def audio_file_name
          @args[:track_id]
        end

        def file_extension
          self.class::FILE_EXTENSION
        end
      end
    end
  end
end
