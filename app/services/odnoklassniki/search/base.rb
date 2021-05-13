module Odnoklassniki
  module Search
    class Base < Odnoklassniki::Base
      include Muffon::Utils::Paginated

      private

      def primary_args
        [@args.query]
      end

      def no_data?
        response_data[collection_name].blank?
      end

      def endpoint_name
        collection_name
      end

      def params
        super.merge(search_params)
      end

      def search_params
        {
          q: @args.query,
          start: offset,
          count: limit
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

      def total_items_count
        response_data.dig('relevantCounts', collection_name)
      end

      def collection_data
        collection_list.map { |i| collection_list_item(i) }
      end

      def collection_list
        response_data[collection_name]
      end
    end
  end
end
