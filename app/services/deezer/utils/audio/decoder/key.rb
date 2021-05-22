module Deezer
  module Utils
    module Audio
      class Decoder
        class Key < Deezer::Utils::Audio::Decoder
          SALT = 'g4el58wc0zvf9na1'.freeze

          def call
            return '' if @args.track_id.blank?

            data
          end

          private

          def data
            first, second = track_id_hash.scan(/.{16}/)

            16.times.each_with_object('') do |i, memo|
              memo << (
                first[i].ord ^ second[i].ord ^ SALT[i].ord
              ).chr
            end
          end

          def track_id_hash
            Digest::MD5.hexdigest(
              @args.track_id.to_s
            )
          end
        end
      end
    end
  end
end
