module Genius
  class Base < Muffon::Base
    SOURCE_NAME = 'genius'.freeze
    REQUEST_BASE_URL = 'https://genius.com/api'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          proxy: request_proxy
        )
    end

    def request_params
      {}
    end

    def request_proxy
      @request_proxy ||=
        proxy_data
        .dig(:uk, :ipv6)
        .sample
    end

    def next_page
      page.to_i + 1
    end
  end
end
