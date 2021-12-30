module API
  module V2
    module Bandcamp
      class LabelsController < API::V2::BaseController
        def artists
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        private

        def artists_data
          ::Bandcamp::Label::Artists.call(
            params.slice(
              *%i[label_id profile_id page limit]
            )
          )
        end

        def albums_data
          ::Bandcamp::Label::Albums.call(
            params.slice(
              *%i[label_id profile_id page limit]
            )
          )
        end
      end
    end
  end
end
