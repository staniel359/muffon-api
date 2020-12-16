module LastFM
  module Top
    class Base < LastFM::API
      private

      def primary_args
        []
      end

      def data
        { top: top_data }
      end

      def top_data
        {
          page: page,
          total_pages: total_pages,
          collection_name.to_sym => collection
        }
      end

      def page
        response_data.dig('@attr', 'page').to_i
      end

      def total_pages
        response_data.dig('@attr', 'totalPages').to_i
      end
    end
  end
end
