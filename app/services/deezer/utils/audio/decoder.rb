module Deezer
  module Utils
    module Audio
      class Decoder < Deezer::Base
        CHUNK_SIZE = 2048
        INTERVAL_CHUNK = 3

        def call
          return '' if raw_audio_link.blank?

          data
        end

        private

        def raw_audio_link
          @raw_audio_link ||=
            Deezer::Utils::Audio::Link.call(
              track_id: @args[:track_id]
            )
        end

        def data
          chunks_count
            .times
            .each_with_object('') do |i, memo|
              process_chunk(i, memo)
            end
        end

        def chunks_count
          raw_binary_data.size.fdiv(
            CHUNK_SIZE
          ).ceil
        end

        def raw_binary_data
          @raw_binary_data ||=
            RestClient.get(
              raw_audio_link
            )
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
            raw_binary_data.size -
              used_chunks_size
          ].min

          raw_binary_data[
            used_chunks_size,
            current_chunk_size
          ]
        end

        def decrypt_chunk?(index, chunk)
          (index % INTERVAL_CHUNK).zero? &&
            chunk.size == CHUNK_SIZE
        end

        def blowfish
          @blowfish ||=
            Deezer::Utils::Audio::Decoder::Blowfish.new(
              track_id: @args[:track_id]
            )
        end
      end
    end
  end
end
