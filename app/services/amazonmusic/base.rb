module AmazonMusic
  class Base < Muffon::Base
    SOURCE_NAME = 'amazonmusic'.freeze
    REQUEST_URL = 'https://gql.music.amazon.co.uk'.freeze

    include Muffon::Mixins::GlobalStorage
    include AmazonMusic::Mixins::Base

    private

    def response_data
      @response_data ||=
        Muffon::Request.call(
          url: request_url,
          method: 'POST',
          payload: request_payload,
          headers: request_headers,
          cookies: request_cookies,
          proxy: request_proxy
        )
    end

    def request_url
      self.class::REQUEST_URL
    end

    def request_headers
      {
        'csrf-token' => csrf_token,
        'csrf-rnd' => csrf_rnd,
        'csrf-ts' => csrf_ts,
        'x-amzn-device-id' => device_id,
        'x-amzn-device-type' => device_type_id,
        'x-api-key' => web_api_key
      }
    end

    def csrf_token
      credentials.dig(
        :amazon_music,
        :csrf_token
      )
    end

    def csrf_rnd
      credentials.dig(
        :amazon_music,
        :csrf_rnd
      )
    end

    def csrf_ts
      credentials.dig(
        :amazon_music,
        :csrf_ts
      )
    end

    def device_id
      credentials.dig(
        :amazon_music,
        :device_id
      )
    end

    def device_type_id
      credentials.dig(
        :amazon_music,
        :device_type_id
      )
    end

    def web_api_key
      credentials.dig(
        :amazon_music,
        :web_api_key
      )
    end

    def request_cookies
      return test_request_cookies if test?

      JSON.parse(
        get_global_value(
          'amazonmusic:cookies',
          refresh_class_name: 'AmazonMusic::Utils::Cookies',
          is_refresh: refresh_cookies?,
          type: 'hash'
        )
      )
    end

    def test_request_cookies
      credentials.dig(
        :amazon_music,
        :cookies
      )
    end

    def refresh_cookies?
      !!@args[:is_refresh_cookies]
    end

    def retry_with_new_cookies
      self.class.call(
        **@args,
        is_refresh_cookies: true
      )
    end

    def request_proxy
      @request_proxy ||= proxy_data.dig(:uk, :ipv4)[0]
    end
  end
end
