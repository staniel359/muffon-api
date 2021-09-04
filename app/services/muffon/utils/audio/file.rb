module Muffon
  module Utils
    module Audio
      module File
        def call
          return '' if not_all_args?

          save_audio_and_return_path
        end

        private

        def save_audio_and_return_path
          create_audio_folder

          audio_file.write(
            audio_binary_data
          )

          audio_link
        end

        def create_audio_folder
          FileUtils.mkdir_p(
            "public/#{audio_folder}"
          )
        end

        def audio_folder
          "temp/audio/#{self.class::SOURCE_ID}"
        end

        def audio_file
          ::File.open(
            "public/#{audio_path}", 'wb'
          )
        end

        def audio_path
          @audio_path ||=
            "#{audio_folder}/#{@args.track_id}.mp3"
        end

        def audio_link
          "#{secrets[:files_url]}/#{audio_path}"
        end
      end
    end
  end
end
