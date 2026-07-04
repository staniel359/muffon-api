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
                  chunk
                  index
                  key
                ]
              end

              def data
                if decrypt_chunk?
                  chunk_decrypted
                else
                  @args[:chunk]
                end
              end

              def decrypt_chunk?
                (@args[:index] % ENCRYPTED_CHUNK_INTERVAL).zero? &&
                  full_size_chunk?
              end

              def full_size_chunk?
                @args[:chunk].size == CHUNK_SIZE
              end

              def chunk_decrypted
                decrypt_string(
                  value: @args[:chunk],
                  algorithm: ENCRYPTION_ALGORITHM,
                  key: @args[:key],
                  initial_value: decryption_initial_value
                )
              end

              def decryption_initial_value
                [raw_decryption_initial_value].pack('H*')
              end

              def raw_decryption_initial_value
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
