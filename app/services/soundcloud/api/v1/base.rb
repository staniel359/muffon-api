module SoundCloud
  module API
    module V1
      class Base < SoundCloud::Base
        BASE_LINK = 'https://api.soundcloud.com'.freeze

        private

        def client_id
          secrets.soundcloud[:api_key]
        end
      end
    end
  end
end
