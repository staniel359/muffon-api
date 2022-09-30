module Muffon
  module Utils
    module Audio
      module File
        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def no_data?
          false
        end

        def data
          create_audio_folder

          write_audio_data_to_file

          audio_link
        end

        def create_audio_folder
          FileUtils.mkdir_p(
            "public/#{audio_folder}"
          )
        end

        def audio_folder
          "files/audio/#{source_name}"
        end

        def write_audio_data_to_file
          audio_file.write(
            audio_binary_data
          )
        end

        def audio_file
          ::File.open(
            "public/#{audio_path}", 'wb'
          )
        end

        def audio_path
          @audio_path ||=
            "#{audio_folder}/#{@args[:track_id]}.mp3"
        end

        def audio_link
          "#{secrets[:url]}/#{audio_path}"
        end
      end
    end
  end
end
