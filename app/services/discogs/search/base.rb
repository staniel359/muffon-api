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
          collection_key => send(collection_key)
        }
      end

      def page
        response_data.dig('pagination', 'page')
      end

      def api_link
        'https://api.discogs.com/database/search'
      end

      def extra_params
        {
          query: @args.query,
          type: discogs_collection_type,
          page: @args.page,
          per_page: @args.limit
        }
      end

      def discogs_collection_type
        collection_type
      end

      def total_pages
        response_data.dig('pagination', 'pages')
      end

      def collection_key
        collection_type.pluralize.to_sym
      end
    end
  end
end
