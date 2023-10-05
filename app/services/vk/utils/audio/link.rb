module VK
  module Utils
    module Audio
      class Link < VK::Base
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
          convert_m3u8_file_to_ts_file

          convert_ts_file_to_mp3_file

          delete_ts_file if ts_file_present?
        end

        def convert_m3u8_file_to_ts_file
          `streamlink --output #{ts_file_name} -f \
            #{@args[:link]} best`
        end

        def ts_file_name
          "#{file_path}.ts"
        end

        def file_path
          "public/#{audio_folder}/#{@args[:track_id]}"
        end

        def convert_ts_file_to_mp3_file
          return if test?

          `ffmpeg -loglevel panic -y \
            -i #{file_path}.ts \
            -c copy #{file_path}.mp3`
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
