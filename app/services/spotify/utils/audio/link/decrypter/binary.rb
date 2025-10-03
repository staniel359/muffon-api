module Spotify
  module Utils
    module Audio
      class Link
        module Decrypter
          class Binary < Spotify::Utils::Audio::Link
            START_BYTE = 167
            CIPHER_ALGORITHM = 'AES-128-CTR'.freeze

            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                file_link
                key
              ]
            end

            def data
              decrypted_data[START_BYTE..]
            end

            def decrypted_data
              Muffon::Utils::Decrypter.call(
                binary: response.body,
                algorithm: CIPHER_ALGORITHM,
                key: key_bytes_string,
                iv: iv_bytes_string
              )
            end

            def headers
              nil
            end

            def link
              @args[:file_link]
            end

            def key_bytes_string
              [key_string].pack('H*')
            end

            def key_string
              @args[:key]
            end

            def iv_bytes_string
              [iv_string].pack('H*')
            end

            def iv_string
              credentials.dig(
                :spotify,
                :iv
              )
            end
          end
        end
      end
    end
  end
end
