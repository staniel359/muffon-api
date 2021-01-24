module LastFM
  module Utils
    class PaginatedData < LastFM::Base
      def call
        paginated_data
      end

      private

      def paginated_data
        {
          page: page,
          total_pages: total_pages,
          collection: collection_data
        }
      end

      def page
        (@args.page || 1).to_i
      end

      def total_pages
        @args.data.size.fdiv(limit).ceil
      end

      def limit
        (@args.limit || 50).to_i
      end

      def collection_data
        @args.data.slice(offset, limit).to_a
      end

      def offset
        (page - 1) * limit
      end
    end
  end
end
