module Spotify
  module Utils
    module Audio
      class Decrypter
        class GlobalId < Spotify::Utils::Audio::Decrypter
          DECODE_STRING = '0123456789' \
                          'abcdefghijklmnopqrstuvwxyz' \
                          'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

          private

          def primary_args
            [@args[:track_id]]
          end

          def no_data?
            false
          end

          def data
            numbers
              .sum
              .to_s(16)
          end

          def numbers
            chars
              .map
              .with_index do |char, index|
                format_char(
                  char, index
                )
              end
          end

          def chars
            @args[:track_id].chars
          end

          def format_char(char, index)
            char_index(char) *
              multiplier(index)
          end

          def char_index(char)
            DECODE_STRING.index(char)
          end

          def multiplier(index)
            decode_string_size **
              power(index)
          end

          def decode_string_size
            @decode_string_size ||=
              DECODE_STRING.size
          end

          def power(index)
            track_id_size - (
              index + 1
            )
          end

          def track_id_size
            @track_id_size ||=
              @args[:track_id].size
          end
        end
      end
    end
  end
end
