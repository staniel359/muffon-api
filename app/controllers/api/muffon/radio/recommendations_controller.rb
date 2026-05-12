module API
  module Muffon
    module Radio
      class RecommendationsController < API::BaseController
        def artists; end

        def tracks; end

        private

        def artists_data
          ::Muffon::Radio::Recommendations::Artists.call(
            params.slice(
              *%i[
                profile_id
                token
              ]
            )
          )
        end

        def tracks_data
          ::Muffon::Radio::Recommendations::Tracks.call(
            params.slice(
              *%i[
                profile_id
                token
              ]
            )
          )
        end
      end
    end
  end
end
