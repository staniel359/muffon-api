module Spotify
  module Utils
    module User
      class AccessToken
        class Refresh < Spotify::Utils::User::AccessToken
          private

          def data
            { access_token: }
          end

          def payload
            {
              grant_type: 'refresh_token',
              refresh_token:
            }
          end

          def refresh_token
            spotify_connection.refresh_token
          end

          def spotify_connection
            @spotify_connection ||=
              profile.spotify_connection
          end

          def client_id
            spotify_connection.client_id
          end

          def client_secret
            spotify_connection.client_secret
          end
        end
      end
    end
  end
end
