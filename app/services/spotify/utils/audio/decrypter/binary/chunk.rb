module Spotify
  module Utils
    module Audio
      class Decrypter
        class Binary
          class Chunk < Spotify::Utils::Audio::Decrypter::Binary
            CHUNK_PART_SIZE = 4096
            IV = "r\xe0g\xfb\xdd\xcb\xcfw" \
                 "\xeb\xe8\xbcd?c\r\x93".freeze

            private

            def primary_args
              [
                @args[:binary],
                @args[:index]
              ]
            end

            def no_data?
              false
            end

            def data
              parts_count
                .times
                .with_object('') do |index, memo|
                  memo << process_part(index)
                end
            end

            def parts_count
              chunk_binary
                .size
                .fdiv(
                  CHUNK_PART_SIZE
                ).ceil
            end

            def chunk_binary
              @chunk_binary ||=
                binary[
                  passed_chunks_size,
                  current_chunk_size
                ]
            end

            def binary
              @args[:binary]
            end

            def passed_chunks_size
              CHUNK_SIZE * index
            end

            def index
              @args[:index]
            end

            def current_chunk_size
              [
                CHUNK_SIZE,
                remaining_chunks_size
              ].min
            end

            def remaining_chunks_size
              binary.size -
                passed_chunks_size
            end

            def process_part(index)
              Spotify::Utils::Audio::Decrypter::Binary::Chunk::Part.call(
                chunk_binary:,
                index:,
                key:,
                chunk_iv_integer:
              )
            end

            def key
              @args[:key]
            end

            def chunk_iv_integer
              @chunk_iv_integer ||=
                iv_integer + (
                  CHUNK_SIZE * index / 16
                )
            end

            def iv_integer
              IV.bytes.inject(0) do |a, b|
                (a << 8) + b
              end
            end
          end
        end
      end
    end
  end
end
