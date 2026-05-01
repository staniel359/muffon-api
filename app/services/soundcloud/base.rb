module SoundCloud
  class Base < Muffon::Base
    SOURCE_NAME = 'soundcloud'.freeze
    REQUEST_BASE_URL = 'https://api-v2.soundcloud.com'.freeze

    include Muffon::Mixins::GlobalStorage

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
      { client_id: }
    end

    def client_id
      return test_client_id if test?

      @client_id ||=
        get_global_value(
          'soundcloud:client_id',
          refresh_class_name:
            'SoundCloud::Utils::ClientId',
          is_refresh: refresh_client_id?
        )
    end

    def test_client_id
      credentials.dig(
        :soundcloud,
        :test_client_id
      )
    end

    def refresh_client_id?
      !!@args[:is_refresh_client_id]
    end

    def request_proxy
      proxy_data
        .dig(:uk, :ipv4)
        .sample
    end

    def retry_with_new_client_id
      self.class.call(
        **@args,
        is_refresh_client_id: true
      )
    end
  end
end
