module API
  module V2
    module Discogs
      class LabelsController < API::V2::BaseController
        def info
          render_data_with_status
        end

        def description
          render_data_with_status
        end

        def albums
          render_data_with_status
        end

        private

        def info_data
          ::Discogs::Label::Info.call(
            params.slice(:label_id)
          )
        end

        def description_data
          ::Discogs::Label::Description.call(
            params.slice(:label_id)
          )
        end

        def albums_data
          ::Discogs::Label::Albums.call(
            params.slice(
              *%i[label_id page limit]
            )
          )
        end
      end
    end
  end
end
