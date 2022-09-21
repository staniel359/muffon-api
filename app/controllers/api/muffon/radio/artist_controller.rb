module API
  module Muffon
    module Radio
      class ArtistController < API::BaseController
        def tracks; end

        def similar; end

        private

        def tracks_data
          ::Muffon::Radio::Artist::Tracks.call(
            params.slice(
              *%i[artist]
            )
          )
        end

        def similar_data
          ::Muffon::Radio::Artist::Similar.call(
            params.slice(
              *%i[artist]
            )
          )
        end
      end
    end
  end
end
