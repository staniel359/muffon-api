module Recaptcha
  class Checker < Muffon::Base
    BASE_LINK =
      'https://www.google.com/recaptcha/api/siteverify'.freeze

    private

    def primary_args
      [@args[:recaptcha]]
    end

    def data
      response_data['success']
    end

    def params
      {
        secret: recaptcha_secret,
        response: @args[:recaptcha]
      }
    end

    def recaptcha_secret
      secrets.recaptcha[:secret]
    end

    def link
      BASE_LINK
    end
  end
end
