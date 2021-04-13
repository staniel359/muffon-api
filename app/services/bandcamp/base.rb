module Bandcamp
  class Base < Muffon::Base
    def call
      return handlers.bad_request if not_all_args?
      return handlers.not_found if no_data?

      data
    end

    private

    def no_data?
      response_data.blank?
    end

    def response_data
      @response_data ||= JSON.parse(response)
    end

    def response
      RestClient.get(link, headers)
    end

    def headers
      { params: params }
    end

    def params
      {}
    end

    def image_data(image)
      Bandcamp::Utils::Image.call(image: image)
    end
  end
end
