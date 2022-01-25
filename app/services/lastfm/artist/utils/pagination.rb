module LastFM
  module Artist
    module Utils
      module Pagination
        include LastFM::Utils::Pagination

        private

        def no_data?
          super ||
            raw_collection_list.blank?
        end

        def total_limit
          self.class::TOTAL_LIMIT
        end

        def artist_data
          artist_base_data
            .merge(paginated_data)
        end

        def artist_base_data
          { name: }
        end

        def name
          artist.dig(
            '@attr', 'artist'
          )
        end

        def total_items_count
          [
            raw_collection_list.size,
            self.class::LIMIT
          ].min
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
