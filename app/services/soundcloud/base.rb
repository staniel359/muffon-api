module SoundCloud
  class Base < Muffon::Base
    SOURCE_NAME = 'soundcloud'.freeze
    BASE_LINK = 'https://api-v2.soundcloud.com'.freeze

    include Muffon::Mixins::GlobalStorage

    private

    def params
      { client_id: }
    end

    def proxy
      proxy_data
        .dig(:uk, :ipv4)
        .sample
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

    def retry_with_new_client_id
      self.class.call(
        **@args,
        is_refresh_client_id: true
      )
    end
  end
end
