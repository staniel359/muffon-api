module Deezer
  module Utils
    module Audio
      class Decoder
        class Blowfish < Deezer::Utils::Audio::Decoder
          def initialize(args = {})
            super

            @cipher_key = cipher_key
            @cipher_iv = cipher_iv
          end

          def decrypt(string = '')
            return '' if string.to_s.size.zero?

            decrypt_string(string)
          end

          private

          def cipher_key
            Deezer::Utils::Audio::Decoder::Key.call(
              track_id: @args.track_id
            )
          end

          def cipher_iv
            (0..7).to_a.pack('C*')
          end

          def decrypt_string(string)
            cipher.key = @cipher_key
            cipher.iv = @cipher_iv
            cipher.padding = 0

            cipher.update(string) << cipher.final
          end

          def cipher
            @cipher ||= OpenSSL::Cipher.new('bf-cbc').decrypt
          end
        end
      end
    end
  end
end
