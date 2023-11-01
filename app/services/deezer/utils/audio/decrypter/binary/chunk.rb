module Deezer
  module Utils
    module Audio
      class Decrypter
        class Binary
          class Chunk < Deezer::Utils::Audio::Decrypter::Binary
            INTERVAL = 3
            CIPHER_ALGORITHM = 'bf-cbc'.freeze
            IV = "\x00\x01\x02\x03\x04\x05\x06\a".freeze

            private

            def primary_args
              [
                @args[:binary],
                @args[:index],
                @args[:key]
              ]
            end

            def no_data?
              false
            end

            def data
              if decrypt_chunk?
                decrypted_chunk_binary
              else
                chunk_binary
              end
            end

            def decrypt_chunk?
              multiple_of_interval? &&
                full_size?
            end

            def multiple_of_interval?
              (index % INTERVAL).zero?
            end

            def index
              @args[:index]
            end

            def full_size?
              chunk_binary.size ==
                CHUNK_SIZE
            end

            def chunk_binary
              @chunk_binary ||=
                Muffon::Binary::Chunk.call(
                  binary:,
                  chunk_size: CHUNK_SIZE,
                  index:
                )
            end

            def binary
              @args[:binary]
            end

            def decrypted_chunk_binary
              Muffon::Decrypter.call(
                binary: chunk_binary,
                algorithm: CIPHER_ALGORITHM,
                key:,
                iv: IV,
                no_padding: true
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
end
