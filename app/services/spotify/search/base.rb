module Spotify
  module Search
    class Base < Spotify::Base
      private

      def primary_args
        [@args.query]
      end

      def no_data?
        results.blank?
      end

      def results
        response_data.dig(collection_name, 'items')
      end

      def link
        "#{base_link}/search"
      end

      def params
        {
          q: @args.query,
          limit: limit,
          offset: offset,
          type: collection_type
        }
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

      def total_items
        response_data.dig(collection_name, 'total')
      end
    end
  end
end
