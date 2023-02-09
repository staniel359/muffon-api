module Deezer
  module Utils
    module Audio
      class Decoder
        class Key < Deezer::Utils::Audio::Decoder
          SALT = 'g4el58wc0zvf9na1'.freeze
          STRING_SIZE = 16

          def call
            return if not_all_args?

            data
          end

          private

          def primary_args
            [@args[:track_id]]
          end

          def data
            STRING_SIZE
              .times
              .each_with_object('') do |index, string|
                append_new_string_to_string(
                  index, string
                )
              end
          end

          def append_new_string_to_string(index, string)
            first =
              decode_string[0][index].ord

            second =
              decode_string[1][index].ord

            third = SALT[index].ord

            new_string =
              first ^ second ^ third

            string << new_string.chr
          end

          def decode_string
            @decode_string ||=
              track_id_hash.scan(
                /.{#{STRING_SIZE}}/
              )
          end

          def track_id_hash
            Digest::MD5.hexdigest(
              @args[:track_id].to_s
            )
          end
        end
      end
    end
  end
end
