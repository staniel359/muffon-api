module VK
  module Utils
    module Audio
      class Cipher < VK::Base
        def call
          return if not_all_args?

          data
        end

        private

        def primary_args
          [@args[:key]]
        end

        def data
          cipher.decrypt

          cipher.key = @args[:key]

          cipher.iv = iv

          cipher
        end

        def cipher
          @cipher ||=
            OpenSSL::Cipher.new(
              'aes-128-cbc'
            )
        end

        def iv
          Array.new(
            16, 0
          ).pack(
            'C*'
          )
        end
      end
    end
  end
end
