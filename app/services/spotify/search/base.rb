module Spotify
  module Search
    class Base < Spotify::Base
      TOTAL_LIMIT = 10_000

      include Spotify::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def collection_list
        response_data.dig(
          collection_name, 'items'
        )
      end

      def link
        "#{BASE_LINK}/search"
      end

      def params
        super
          .merge(search_params)
          .merge(pagination_params)
      end

      def search_params
        {
          q: @args[:query],
          type: collection_type
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def data
        { search: paginated_data }
      end

      def collection_count
        response_data.dig(
          collection_name, 'total'
        )
      end
    end
  end
end
