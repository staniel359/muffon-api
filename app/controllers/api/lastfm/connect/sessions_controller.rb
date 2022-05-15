module API
  module LastFM
    module Connect
      class SessionsController < API::LastFM::ConnectController
        def create
          render_data_with_status
        end

        def destroy
          render_data_with_status
        end

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
