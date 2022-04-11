module LastFM
  module Track
    module Utils
      module Pagination
        include LastFM::Utils::Pagination

        private

        def no_data?
          super ||
            raw_collection_list.blank? ||
            page_out_of_bounds?
        end

        def params
          super.merge(
            pagination_params
          )
        end

        def track_data
          track_info_data
            .merge(paginated_data)
        end

        def track_info_data
          raw_track_info_data.slice(
            :title, :artists
          )
        end

        def raw_track_info_data
          LastFM::Track::Info.call(
            @args
          )[:track]
        end

        def total_items_count
          raw_collection_list.size
        end

        def collection_list
          collection_paginated(
            raw_collection_list
          )
        end
      end
    end
  end
end
