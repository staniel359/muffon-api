module Spotify
  module Utils
    module Audio
      class Decrypter
        class Binary < Spotify::Utils::Audio::Decrypter
          CHUNK_SIZE = 131_072
          START_BYTE = 167

          private

          def primary_args
            [
              @args[:file_link],
              @args[:key]
            ]
          end

          def no_data?
            false
          end

          def data
            decrypted_data[
              START_BYTE..
            ]
          end

          def decrypted_data
            chunks_count
              .times
              .with_object('') do |index, memo|
                memo << process_chunk(index)
              end
          end

          def chunks_count
            response
              .body
              .size
              .fdiv(
                CHUNK_SIZE
              ).ceil
          end

          def headers
            nil
          end

          def link
            @args[:file_link]
          end

          def process_chunk(index)
            Spotify::Utils::Audio::Decrypter::Binary::Chunk.call(
              binary: response.body,
              index:,
              key:
            )
          end

          def key
            @args[:key]
          end
        end
      end
    end
  end
end
