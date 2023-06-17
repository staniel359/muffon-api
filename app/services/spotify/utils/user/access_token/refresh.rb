module Spotify
  module Utils
    module User
      class AccessToken
        class Refresh < Spotify::Utils::User::AccessToken
          private

          def primary_args
            [@args[:refresh_token]]
          end

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
            @args[:refresh_token]
          end
        end
      end
    end
  end
end
