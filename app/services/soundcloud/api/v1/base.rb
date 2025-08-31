module SoundCloud
  module API
    module V1
      class Base < SoundCloud::Base
        BASE_LINK =
          'https://api.soundcloud.com'.freeze

        def call
          super
        rescue Faraday::UnauthorizedError
          retry_with_new_access_token
        end

        private

        def params
          nil
        end

        def headers
          {
            'Authorization' =>
              "OAuth #{access_token}"
          }
        end

        def access_token
          return test_access_token if test?

          get_global_value(
            'soundcloud:v1:access_token',
            refresh_class_name:
              'SoundCloud::Utils::AccessToken',
            is_refresh: refresh_access_token?
          )
        end

        def test_access_token
          credentials.dig(
            :soundcloud,
            :test_access_token
          )
        end

        def refresh_access_token?
          !!@args[:is_refresh_access_token]
        end

        def retry_with_new_access_token
          self.class.call(
            **@args,
            is_refresh_access_token: true
          )
        end
      end
    end
  end
end
