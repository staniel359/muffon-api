module SoundCloud
  module API
    module V1
      class Base < SoundCloud::Base
        BASE_LINK =
          'https://api.soundcloud.com'.freeze

        include Muffon::Utils::Global

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
            'soundcloud_access_token'
          )
        end

        def test_access_token
          secrets.soundcloud[
            :test_access_token
          ]
        end

        def global_value
          @global_value ||=
            SoundCloud::Utils::AccessToken.call
        end

        def retry_with_new_access_token
          return if global_value.blank?

          update_global_value(
            'soundcloud_access_token'
          )

          call
        end
      end
    end
  end
end
