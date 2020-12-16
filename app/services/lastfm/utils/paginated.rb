module LastFM
  module Utils
    class Paginated < LastFM::Base
      def call
        paginated_data
      end

      private

      def paginated_data
        {
          page: page,
          total_pages: total_pages,
          collection: collection
        }
      end

      def page
        [@args.page.to_i, 1].max
      end

      def total_pages
        @args.collection.size.fdiv(page_limit).ceil
      end

      def page_limit
        (@args.limit || 50).to_i
      end

      def collection
        @args.collection.slice(offset, page_limit) || []
      end

      def offset
        (page - 1) * page_limit
      end
    end
  end
end
