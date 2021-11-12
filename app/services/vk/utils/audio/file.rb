module VK
  module Utils
    module Audio
      class File < VK::Base
        include Muffon::Utils::Audio::File

        private

        def primary_args
          [
            @args.track_id,
            @args.link
          ]
        end

        def save_audio_and_return_path
          create_audio_folder

          save_audio

          audio_link
        end

        def save_audio
          ts_file.write(ts_data)

          convert_ts_file_to_mp3

          delete_ts_file
        end

        def ts_file
          ::File.open(
            "#{file_path}.ts", 'wb'
          )
        end

        def file_path
          "public/#{audio_folder}/#{@args.track_id}"
        end

        def ts_data
          threads = []
          data = []

          fragments_paths.each.with_index do |path, index|
            threads << Thread.new do
              data << [index, process_fragment(path, index)]
            end
          end

          threads.each(&:join)

          data.sort.map(&:second).join
        end

        def fragments_paths
          response_data.scan(
            /([\w\-]+\.ts[?\w\-=&]*)/
          ).flatten
        end

        def response_data
          @response_data ||= RestClient.get(
            @args.link
          ).body
        end

        def process_fragment(path, index)
          if (index % 3).zero?
            decrypt_fragment(path)
          else
            fragment_response_data(path)
          end
        end

        def decrypt_fragment(path)
          cipher = OpenSSL::Cipher.new(
            'aes-128-cbc'
          )

          cipher.decrypt

          cipher.key = key
          cipher.iv = iv

          cipher.update(
            fragment_response_data(path)
          ) + cipher.final
        end

        def key
          @key ||= RestClient.get(
            key_link
          ).body
        end

        def key_link
          response_data.match(
            /#EXT-X-KEY:METHOD=AES-128,URI="(.+)"/
          )[1]
        end

        def iv
          @iv ||= Array.new(16, 0).pack('C*')
        end

        def fragment_response_data(path)
          RestClient.get(
            "#{base_link}#{path}"
          ).body
        end

        def base_link
          @base_link ||= @args.link.match(
            /(.+)index.m3u8/
          )[1]
        end

        def convert_ts_file_to_mp3
          return if Rails.env.test?

          `ffmpeg -hide_banner -loglevel panic -y \
            -i #{file_path}.ts -c copy #{file_path}.mp3`
        end

        def delete_ts_file
          ::File.delete(
            "#{file_path}.ts"
          )
        end
      end
    end
  end
end
