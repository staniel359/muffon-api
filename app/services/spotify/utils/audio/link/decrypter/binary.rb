module Spotify
  module Utils
    module Audio
      class Link
        module Decrypter
          class Binary < Spotify::Utils::Audio::Link
            START_BYTE = 167
            IV = '72e067fbddcbcf77ebe8bc643f630d93'.freeze
            CIPHER_ALGORITHM = 'aes-128-ctr'.freeze

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
              Muffon::Decrypter.call(
                binary: response.body,
                algorithm: CIPHER_ALGORITHM,
                key:,
                iv:
              )[START_BYTE..]
            end

            def headers
              nil
            end

            def link
              @args[:file_link]
            end

            def key
              [@args[:key]].pack('H*')
            end

            def iv
              [IV].pack('H*')
            end
          end
        end
      end
    end
  end
end
