module Muffon
  module Utils
    module Audio
      module Link
        FILE_EXTENSION = 'mp3'.freeze

        def call
          check_args

          return if no_data?

          data
        end

        private

        def no_data?
          audio_binary_data.blank?
        end

        def data
          create_audio_folder

          write_audio_data_to_file

          audio_link
        end

        def create_audio_folder
          return if test?

          FileUtils.mkdir_p(
            "public/#{audio_folder}"
          )
        end

        def audio_folder
          "media/audio/#{source_name}"
        end

        def write_audio_data_to_file
          return if test?

          File.open(
            "public/#{audio_path}",
            'wb'
          ) do |file|
            file << audio_binary_data
          end
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

        def audio_link
          "#{credentials[:url]}/#{audio_path}"
        end
      end
    end
  end
end
