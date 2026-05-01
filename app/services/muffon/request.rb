module Muffon
  class Request < Muffon::Base
    AVAILABLE_METHODS = %w[
      GET
      POST
    ].freeze

    def call
      check_args

      data
    end

    private

    def required_args
      %i[
        url
        method
      ]
    end

    def wrong_args?
      AVAILABLE_METHODS.exclude?(
        @args[:method]
      )
    end

    def data
      case @args[:response_type]
      when 'raw'
        response
      when 'html'
        html_response_data
      else
        response_data
      end
    end

    def html_response_data
      Nokogiri::HTML.parse(
        response.body
      )
    end

    def response_data
      JSON.parse(
        response.body
      )
    end

    def response
      case @args[:method]
      when 'GET'
        perform_get_request
      when 'POST'
        perform_post_request
      end
    end

    def perform_get_request
      client.get(
        @args[:url],
        @args[:params],
        headers
      )
    end

    def perform_post_request
      client.post(
        @args[:url],
        @args[:payload],
        headers
      )
    end

    def client
      Faraday.new(
        params: @args[:params],
        proxy: @args[:proxy],
        request: {
          params_encoder: Faraday::FlatParamsEncoder
        }
      ) do |connection|
        setup_connection(
          connection
        )
      end
    end

    def setup_connection(
      connection
    )
      connection.response(
        :raise_error
      )

      if redirect?
        connection.response(
          :follow_redirects
        )
      end

      if @args[:payload].is_a?(String)
        connection.request(
          :json
        )
      else
        connection.request(
          :url_encoded
        )
      end
    end

    def redirect?
      if @args.key?(:is_redirect)
        @args[:is_redirect]
      else
        true
      end
    end

    def headers
      {
        'User-Agent' => REQUEST_USER_AGENT,
        'Cookie' => cookie_header,
        **@args[:headers]
      }.compact
    end

    def cookie_header
      return if @args[:cookies].blank?

      @args[:cookies]
        .map do |array|
          array.join('=')
        end
        .join('; ')
    end
  end
end
