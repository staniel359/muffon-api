module Discogs
  module Search
    class Base < Discogs::Base
      include Discogs::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        collection_list.blank?
      end

      def collection_list
        @collection_list ||=
          response_data['results']
      end

      def link
        "#{BASE_LINK}/database/search"
      end

      def params
        super.merge(
          search_params
        )
      end

      def search_params
        {
          query: @args[:query],
          type: collection_type
        }
      end

      def collection_type
        self.class::COLLECTION_TYPE
      end

      def data
        { search: paginated_data }
      end

      def total_pages_count
        response_data.dig(
          'pagination', 'pages'
        )
      end
    end
  end
end
