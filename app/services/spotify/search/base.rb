module Spotify
  module Search
    class Base < Spotify::Base
      include Spotify::Paginated

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
        super.merge(search_params).merge(pagination_params)
      end

      def search_params
        { q: @args.query, type: collection_type }
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

      def total_items_count
        response_data.dig(collection_name, 'total')
      end

      def collection_data
        results.map { |r| collection_item_data(r) }
      end
    end
  end
end
