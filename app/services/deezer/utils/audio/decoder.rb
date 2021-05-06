module Deezer
  module Utils
    module Audio
      class Decoder < Deezer::Utils::Base
        CHUNK_SIZE = 2048
        INTERVAL_CHUNK = 3

        def call
          return '' if @args.track_id.blank? || data.blank?

          create_dir_if_not_exists
          save_decrypted_file
          return_file_path_if_file_exists
        end

        private

        def data
          @data ||= decrypted_binary_data
        end

        def decrypted_binary_data
          chunks_count.times.each_with_object('') do |i, memo|
            process_chunk(i, memo)
          end
        end

        def chunks_count
          binary_data.size.fdiv(CHUNK_SIZE).ceil
        end

        def binary_data
          @binary_data ||= RestClient.get(audio_link).body
        end

        def audio_link
          Deezer::Utils::Audio::Link.call(track_id: @args.track_id)
        end

        def process_chunk(index, memo)
          chunk = chunk(index)

          decrypt_chunk?(index, chunk) && chunk = blowfish.decrypt(chunk)

          memo << chunk
        end

        def chunk(index)
          used_chunks_size = CHUNK_SIZE * index
          current_chunk_size = [
            CHUNK_SIZE,
            binary_data.size - used_chunks_size
          ].min

          binary_data[used_chunks_size, current_chunk_size]
        end

        def decrypt_chunk?(index, chunk)
          (index % INTERVAL_CHUNK).zero? && chunk.size == CHUNK_SIZE
        end

        def blowfish
          @blowfish ||=
            Deezer::Utils::Audio::Decoder::Blowfish.new(
              track_id: @args.track_id
            )
        end

        def create_dir_if_not_exists
          FileUtils.mkdir_p(dir_name) unless File.directory?(dir_name)
        end

        def dir_name
          'public/temp/audio/deezer'
        end

        def save_decrypted_file
          File.open(file_path, 'wb') { |f| f.write(data) }
        end

        def return_file_path_if_file_exists
          File.exist?(file_path) ? file_path : ''
        end

        def file_path
          "#{dir_name}/#{@args.track_id}.mp3"
        end
      end
    end
  end
end
