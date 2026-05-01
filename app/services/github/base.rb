module GitHub
  class Base < Muffon::Base
    REQUEST_BASE_URL =
      'https://api.github.com/repos/staniel359/muffon/releases'.freeze

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'GET',
          params: request_params,
          headers: request_headers
        )
    end

    def request_url
      REQUEST_BASE_URL
    end

    def request_params
      {}
    end

    def request_headers
      { 'Authorization' => "Bearer #{token}" }
    end

    def token
      credentials.dig(
        :github,
        :token
      )
    end
  end
end
