module Deezer
  module Utils
    module Track
      module Audio
        class Link
          class Binary
            class Chunk < Deezer::Base
              ENCRYPTION_ALGORITHM = 'bf-cbc'.freeze
              ENCRYPTED_CHUNK_INTERVAL = 3
              CHUNK_SIZE = 2048

              def call
                check_args

                data
              end

              private

              def required_args
                %i[
                  binary
                  index
                  key
                ]
              end

              def data
                if decrypt_chunk?
                  decrypted_chunk_binary
                else
                  chunk_binary
                end
              end

              def decrypt_chunk?
                encrypted_chunk? && full_size_chunk?
              end

              def encrypted_chunk?
                (@args[:index] % ENCRYPTED_CHUNK_INTERVAL).zero?
              end

              def full_size_chunk?
                chunk_binary.size == CHUNK_SIZE
              end

              def chunk_binary
                @chunk_binary ||= chunk_binary_computed
              end

              def chunk_binary_computed
                passed_chunks_size = CHUNK_SIZE * @args[:index]

                remaining_chunks_size =
                  @args[:binary].size - passed_chunks_size

                current_chunk_size = [
                  CHUNK_SIZE,
                  remaining_chunks_size
                ].min

                @args[:binary][
                  passed_chunks_size,
                  current_chunk_size
                ]
              end

              def decrypted_chunk_binary
                initial_value =
                  [decryption_initial_value].pack('H*')

                decrypt_string(
                  value: chunk_binary,
                  algorithm: ENCRYPTION_ALGORITHM,
                  key: @args[:key],
                  initial_value:
                )
              end

              def decryption_initial_value
                credentials.dig(
                  :deezer,
                  :decryption,
                  :initial_value
                )
              end
            end
          end
        end
      end
    end
  end
end
