module Discogs
  module Search
    class Base < Discogs::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data['results'].blank?
      end

      def data
        { search: search_data }
      end

      def search_data
        {
          page: page,
          total_pages: total_pages,
          collection_name.to_sym => collection_data
        }
      end

      def page
        response_data.dig('pagination', 'page')
      end

      def link
        "#{base_link}/database/search"
      end

      def extra_params
        {
          query: @args.query,
          type: discogs_collection_type,
          page: @args.page,
          per_page: @args.limit
        }
      end

      def total_pages
        response_data.dig('pagination', 'pages')
      end
    end
  end
end
