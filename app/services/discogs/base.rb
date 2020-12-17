module Discogs
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    rescue *Muffon::Errors.list => e
      Muffon::Errors.handle(e.class)
    end

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(api_response)
    end

    def api_response
      RestClient.get(api_link, params: params)
    end

    def params
      auth_params.merge(extra_params)
    end

    def auth_params
      {
        key: secrets.discogs[:api_key],
        secret: secrets.discogs[:api_secret]
      }
    end

    def extra_params
      {}
    end

    def image
      primary_image.present? ? primary_image['uri'] : ''
    end

    def primary_image
      response_data['images'].find { |i| i['type'] == 'primary' }
    end
  end
end
