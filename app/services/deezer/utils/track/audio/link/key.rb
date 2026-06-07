module Deezer
  module Utils
    module Track
      module Audio
        class Link
          class Key < Deezer::Base
            def call
              check_args

              data
            end

            private

            def required_args
              %i[
                track_id
              ]
            end

            def data
              parts
                .map(&:chars)
                .transpose
                .map do |values|
                  values
                    .map(&:ord)
                    .inject(:^)
                end
                .pack('C*')
            end

            def parts
              [
                *track_id_hex_parts,
                salt
              ]
            end

            def track_id_hex_parts
              track_id_hex.scan(
                /.{#{salt.size}}/
              )
            end

            def track_id_hex
              Digest::MD5.hexdigest(
                @args[:track_id].to_s
              )
            end

            def salt
              @salt ||=
                credentials.dig(
                  :deezer,
                  :decryption,
                  :audio_key_salt
                )
            end
          end
        end
      end
    end
  end
end
