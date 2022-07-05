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

        def collection_count
          artist.dig(
            '@attr', 'total'
          ).to_i
        end
      end
    end
  end
end
