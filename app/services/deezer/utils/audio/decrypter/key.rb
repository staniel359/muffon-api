module Deezer
  module Utils
    module Audio
      class Decrypter
        class Key < Deezer::Utils::Audio::Decrypter
          SALT = 'g4el58wc0zvf9na1'.freeze
          STRING_SIZE = 16

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

          def no_data?
            false
          end

          def data
            STRING_SIZE
              .times
              .each_with_object('') do |index, memo|
                add_string_to_memo(
                  index, memo
                )
              end
          end

          def add_string_to_memo(index, memo)
            first =
              decode_strings[0][index].ord

            second =
              decode_strings[1][index].ord

            third = SALT[index].ord

            new_string = (
              first ^ second ^ third
            ).chr

            memo << new_string
          end

          def decode_strings
            @decode_strings ||=
              track_id_hex.scan(
                /.{#{STRING_SIZE}}/
              )
          end

          def track_id_hex
            Digest::MD5.hexdigest(
              track_id
            )
          end

          def track_id
            @args[:track_id].to_s
          end
        end
      end
    end
  end
end
