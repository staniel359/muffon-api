module Deezer
  module Utils
    module Audio
      class Decoder < Deezer::Base
        CHUNK_SIZE = 2048
        INTERVAL_CHUNK = 3

        def call
          return if not_all_args? || no_data?

          data
        end

        private

        def primary_args
          [@args[:track_id]]
        end

        def no_data?
          raw_binary_data.blank?
        end

        def raw_binary_data
          @raw_binary_data ||=
            Deezer::Utils::Audio::Binary.call(
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
          raw_binary_data
            .size
            .fdiv(
              CHUNK_SIZE
            ).ceil
        end

        def process_chunk(index, memo)
          chunk = chunk(index)

          chunk = blowfish.decrypt(chunk) if
              decrypt_chunk?(index, chunk)

          memo << chunk
        end

        def chunk(index)
          raw_binary_data[
            used_chunks_size(index),
            current_chunk_size(index)
          ]
        end

        def used_chunks_size(index)
          CHUNK_SIZE * index
        end

        def current_chunk_size(index)
          [
            CHUNK_SIZE,
            remaining_chunks_size(index)
          ].min
        end

        def remaining_chunks_size(index)
          raw_binary_data.size -
            used_chunks_size(index)
        end

        def decrypt_chunk?(index, chunk)
          (
            index % INTERVAL_CHUNK
          ).zero? && (
            chunk.size == CHUNK_SIZE
          )
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
