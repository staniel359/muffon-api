module SoundCloud
  module API
    module V2
      class Base < SoundCloud::Base
        BASE_LINK = 'https://api-v2.soundcloud.com'.freeze
        include Muffon::Utils::Global

        def call
          super
        rescue RestClient::Unauthorized
          retry_with_new_client_id
        end

        private

        def client_id
          return test_client_id if
              Rails.env.test?

          get_global_value(
            'soundcloud_v2_client_id'
          )
        end

        def test_client_id
          secrets.soundcloud[
            :test_v2_client_id
        ]
        end

        def global_value
          @global_value ||=
            SoundCloud::Utils::ClientId.call
        end

        def retry_with_new_client_id
          return if global_value.blank?

          update_global_value(
            'soundcloud_v2_client_id'
          )

          call
        end
      end
    end
  end
end
