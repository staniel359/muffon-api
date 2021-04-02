module LastFM
  module API
    module Paginated
      include Muffon::Paginated

      private

      def page_limit
        50
      end

      def pagination_params
        { limit: total_limit }
      end

      def total_limit
        200
      end

      def collection_data
        paginated_collection.map { |i| collection_item_data(i) }
      end
    end
  end
end
