module VK
  module Utils
    module Audio
      class File < VK::Base
        include Muffon::Utils::Audio::File

        private

        def primary_args
          [
            @args[:track_id],
            @args[:link]
          ]
        end

        def write_audio_data_to_file
          write_ts_data_to_ts_file

          convert_ts_file_to_mp3_file

          delete_ts_file
        end

        def write_ts_data_to_ts_file
          ts_file.write(
            ts_data
          )

          ts_file.close
        end

        def ts_file
          @ts_file ||= ::File.open(
            ts_file_name, 'wb'
          )
        end

        def ts_file_name
          "#{file_path}.ts"
        end

        def file_path
          "public/#{audio_folder}/#{@args[:track_id]}"
        end

        def ts_data
          VK::Utils::Audio::Decrypter.call(
            link: @args[:link]
          )
        end

        def convert_ts_file_to_mp3_file
          return if Rails.env.test?

          VK::Utils::Audio::Converter.call(
            file_path:
          )
        end

        def delete_ts_file
          VK::Utils::Audio::Deleter.call(
            file_name: ts_file_name
          )
        end
      end
    end
  end
end
