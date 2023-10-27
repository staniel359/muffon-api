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

          convert_m3u8_file_to_ts_file

          convert_ts_file_to_audio_file

          delete_ts_file if ts_file_present?
        end

        def convert_m3u8_file_to_ts_file
          `#{converter_executable} \
            -l #{m3u8_link_formatted} \
            -o #{ts_file_name}`
        end

        def converter_executable
          Rails
            .public_path
            .join(
              'muffon-vk'
            )
        end

        def m3u8_link_formatted
          @args[:link].split(
            'index.m3u8'
          )[0]
        end

        def ts_file_name
          "#{file_path}.ts"
        end

        def file_path
          "public/#{audio_folder}/#{@args[:track_id]}"
        end

        def convert_ts_file_to_audio_file
          `ffmpeg -loglevel panic -y \
            -i #{file_path}.ts \
            -c copy #{audio_file_name}`
        end

        def audio_file_name
          "#{file_path}.#{file_extension}"
        end

        def ts_file_present?
          ::File.exist?(
            ts_file_name
          )
        end

        def delete_ts_file
          ::File.delete(
            ts_file_name
          )
        end
      end
    end
  end
end
