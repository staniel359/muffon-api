module API
  module Muffon
    module Radio
      class TopController < API::BaseController
        def artists; end

        def tracks; end

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
