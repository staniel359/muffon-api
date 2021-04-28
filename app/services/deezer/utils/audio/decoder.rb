module Deezer
  module Utils
    module Audio
      class Decoder < Deezer::Utils::Base
        AUDIO_FOLDER = 'temp/audio/deezer'.freeze
        CHUNK_SIZE = 2048
        INTERVAL_CHUNK = 3

        def call
          return '' if no_data?

          save_file_and_return_file_name
        end

        private

        def no_data?
          @args.track_id.blank? ||
            audio_link.blank? ||
            data.blank?
        end

        def audio_link
          @audio_link ||= Deezer::Utils::Audio::Link.call(
            track_id: @args.track_id
          )
        end

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

        def process_chunk(index, memo)
          chunk = chunk(index)

          decrypt_chunk?(index, chunk) &&
            chunk = blowfish.decrypt(chunk)

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
          (index % INTERVAL_CHUNK).zero? &&
            chunk.size == CHUNK_SIZE
        end

        def blowfish
          @blowfish ||=
            Deezer::Utils::Audio::Decoder::Blowfish.new(
              track_id: @args.track_id
            )
        end

        def save_file_and_return_file_name
          FileUtils.mkdir_p("public/#{AUDIO_FOLDER}")

          file = File.open("public/#{audio_path}", 'wb')

          file.write(data)

          File.exist?(file) ? audio_path : ''
        end

        def audio_path
          "#{AUDIO_FOLDER}/#{@args.track_id}.mp3"
        end
      end
    end
  end
end
