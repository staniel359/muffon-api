module Spotify
  module Utils
    module Audio
      class Decrypter
        class Binary
          class Chunk
            class Part < Spotify::Utils::Audio::Decrypter::Binary::Chunk
              CIPHER = 'aes-128-ctr'.freeze

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
                cipher.decrypt

                cipher.key = key
                cipher.iv = part_iv

                cipher.update(
                  part_binary
                ) << cipher.final
              end

              def cipher
                @cipher ||=
                  OpenSSL::Cipher.new(
                    CIPHER
                  )
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

              def part_binary
                chunk_binary[
                  passed_parts_size,
                  current_part_size
                ]
              end

              def chunk_binary
                @args[:chunk_binary]
              end

              def passed_parts_size
                CHUNK_PART_SIZE * index
              end

              def current_part_size
                [
                  CHUNK_PART_SIZE,
                  remaining_parts_size
                ].min
              end

              def remaining_parts_size
                chunk_binary.size -
                  passed_parts_size
              end
            end
          end
        end
      end
    end
  end
end
