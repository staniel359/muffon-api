module Muffon
  class Decrypter < Muffon::Base
    def call
      check_args

      data
    end

    private

    def required_args
      %i[
        binary
        algorithm
        key
        iv
      ]
    end

    def data
      cipher.decrypt

      set_cipher_data

      decrypt_binary
    end

    def cipher
      @cipher ||=
        OpenSSL::Cipher.new(
          algorithm
        )
    end

    def algorithm
      @args[:algorithm]
    end

    def set_cipher_data
      cipher.key = key

      cipher.iv = iv

      cipher.padding = 0 if no_padding?
    end

    def key
      @args[:key]
    end

    def iv
      @args[:iv]
    end

    def no_padding?
      @args[:no_padding]
    end

    def decrypt_binary
      cipher
        .update(
          binary
        ) <<
        cipher.final
    end

    def binary
      @args[:binary]
    end
  end
end
