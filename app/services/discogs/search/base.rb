module Discogs
  module Search
    class Base < Discogs::Base
      include Discogs::Paginated

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

      def link
        "#{base_link}/database/search"
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          query: @args.query,
          type: discogs_collection_type
        }
      end

      def collection_list
        response_data['results']
      end

      def collection_data
        collection_list.map { |i| collection_item_data(i) }
      end
    end
  end
end
