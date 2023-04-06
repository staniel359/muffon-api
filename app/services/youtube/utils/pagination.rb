module YouTube
  module Utils
    module Pagination
      include Muffon::Utils::Pagination

      private

      def paginated_data
        {
          prev_page:,
          next_page:,
          collection_name.to_sym => collection
        }.compact
      end

      def prev_page
        response_data[
          'prevPageToken'
        ]
      end

      def next_page
        response_data[
          'nextPageToken'
        ]
      end
    end
  end
end
