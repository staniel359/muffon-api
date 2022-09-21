module API
  module LastFM
    module Connect
      class SessionsController < API::LastFM::ConnectController
        def create; end

        def destroy; end

        private

        def create_data
          ::LastFM::Connect::Session::Creator.call(
            params.slice(
              *%i[lastfm_token profile_id token]
            )
          )
        end

        def destroy_data
          ::LastFM::Connect::Session::Destroyer.call(
            params.slice(
              *%i[profile_id token]
            )
          )
        end
      end
    end
  end
end
