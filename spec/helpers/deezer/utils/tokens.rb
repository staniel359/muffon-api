module Helpers
  module Deezer
    module Utils
      module Tokens
        class << self
          def track_data
            {:track_token=>track_token}
          end

          def track_token
            Rails.application.credentials.deezer[:test_track_token]
          end

          def track_no_data
            {:track_token=>""}
          end

          def user_data
            {:api_token=>api_token, :license_token=>license_token}
          end

          def api_token
            Rails.application.credentials.deezer[:test_api_token]
          end

          def license_token
            Rails.application.credentials.deezer[:test_license_token]
          end
        end
      end
    end
  end
end
