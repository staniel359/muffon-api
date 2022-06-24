module LastFM
  module Artist
    module Utils
      module Pagination
        include Muffon::Utils::Pagination

        private

        def params
          super.merge(
            pagination_params
          )
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
            collection_count,
            total_limit
          ].min
        end

        def total_limit
          self.class::TOTAL_LIMIT
        end

        def collection_count
          artist.dig(
            '@attr', 'total'
          ).to_i
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
