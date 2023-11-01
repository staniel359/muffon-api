module Spotify
  module Utils
    module Audio
      class Decrypter
        class Binary
          class Chunk
            class Part < Spotify::Utils::Audio::Decrypter::Binary::Chunk
              CIPHER_ALGORITHM = 'aes-128-ctr'.freeze

              private

              def primary_args
                [
                  @args[:chunk_binary],
                  @args[:index],
                  @args[:key],
                  @args[:chunk_iv_integer]
                ]
              end

              def no_data?
                false
              end

              def data
                Muffon::Decrypter.call(
                  binary: chunk_part_binary,
                  algorithm: CIPHER_ALGORITHM,
                  key:,
                  iv: part_iv
                )
              end

              def chunk_part_binary
                Muffon::Binary::Chunk.call(
                  binary: chunk_binary,
                  chunk_size: CHUNK_PART_SIZE,
                  index:
                )
              end

              def chunk_binary
                @args[:chunk_binary]
              end

              def key
                @args[:key]
              end

              def part_iv
                part_iv_integer
                  .digits(256)
                  .reverse
                  .pack('C*')
              end

              def part_iv_integer
                chunk_iv_integer + (
                  256 * index
                )
              end

              def chunk_iv_integer
                @args[:chunk_iv_integer]
              end

              def index
                @args[:index]
              end
            end
          end
        end
      end
    end
  end
end
