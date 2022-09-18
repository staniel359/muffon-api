module VK
  module Utils
    module Audio
      class Decrypter
        class Fragment < VK::Base
          def call
            return if not_all_args?

            data
          end

          private

          def primary_args
            [
              @args[:index],
              @args[:link],
              @args[:cipher]
            ]
          end

          def data
            [
              @args[:index],
              fragment_data
            ]
          end

          def fragment_data
            if multiple_of_three?
              decrypted_data
            else
              response_data
            end
          end

          def multiple_of_three?
            (
              @args[:index] % 3
            ).zero?
          end

          def decrypted_data
            response_data_decrypted << cipher_final
          end

          def response_data_decrypted
            @args[:cipher].update(
              response_data
            )
          end

          def response_data
            RestClient.get(
              @args[:link]
            ).body
          rescue StandardError
            call
          end

          def cipher_final
            @args[:cipher].final
          end
        end
      end
    end
  end
end
