module LastFM
  module Track
    module Utils
      module Pagination
        include Muffon::Utils::Pagination

        private

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
            :title, :artist, :artists
          )
        end

        def raw_track_info_data
          LastFM::Track::Info.call(
            track_title:
              @args[:track_title],
            artist_name:
              @args[:artist_name]
          )[:track]
        end

        def total_items_count
          @total_items_count ||=
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
