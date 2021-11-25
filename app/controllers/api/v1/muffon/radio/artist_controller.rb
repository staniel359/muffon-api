module API
  module V1
    module Muffon
      module Radio
        class ArtistController < API::V1::BaseController
          def tracks
            render_data_with_status
          end

          def similar
            render_data_with_status
          end

          private

          def tracks_data
            ::Muffon::Radio::Artist::Tracks.call(
              params.slice(:artist)
            )
          end

          def similar_data
            ::Muffon::Radio::Artist::Similar.call(
              params.slice(:artist)
            )
          end
        end
      end
    end
  end
end
