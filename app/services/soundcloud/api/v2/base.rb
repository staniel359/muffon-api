module SoundCloud
  module API
    module V2
      class Base < SoundCloud::Base
        BASE_LINK =
          'https://api-v2.soundcloud.com'.freeze

        private

        def client_id
          return test_client_id if test?

          get_global_value(
            'soundcloud:v2:client_id',
            refresh_class_name:
              'SoundCloud::Utils::ClientId',
            is_refresh: refresh_client_id?
          )
        end

        def test_client_id
          credentials.dig(
            :soundcloud,
            :test_v2_client_id
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
  end
end
