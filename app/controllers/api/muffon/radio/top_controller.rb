module API
  module Muffon
    module Radio
      class TopController < API::BaseController
        def artists
          render_data_with_status
        end

        def tracks
          render_data_with_status
        end

        private

        def artists_data
          ::Muffon::Radio::Top::Artists.call
        end

        def tracks_data
          ::Muffon::Radio::Top::Tracks.call
        end
      end
    end
  end
end
