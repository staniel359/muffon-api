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
        'https://api.spotify.com/v1/search'
      end

      def extra_params
        { type: collection_name.singularize }
      end

      def data
        {
          search: {
            page: page,
            total_pages: total_pages,
            collection_name.to_sym => send(collection_name)
          }
        }
      end

      def total_items
        response_data.dig(collection_name, 'total')
      end
    end
  end
end
