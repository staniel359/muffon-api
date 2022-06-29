module VK
  module Search
    class Base < VK::Base
      TOTAL_LIMIT = 300
      include Muffon::Utils::Pagination

      private

      def primary_args
        [@args[:query]]
      end

      def no_data?
        response_data.blank? ||
          results_list.blank?
      end

      def results_list
        response_data['items']
      end

      def params
        super.merge(
          search_params
        )
      end

      def signature
        "/method/#{api_method}" \
          "?access_token=#{access_token}" \
          '&v=5.131' \
          "&q=#{query}" \
          "&count=#{TOTAL_LIMIT}" \
          "#{api_secret}"
      end

      def query
        @args[:query]
      end

      def search_params
        {
          q: query,
          count: TOTAL_LIMIT
        }
      end

      def data
        { search: paginated_data }
      end

      def total_items_count
        results_list.size
      end

      def collection_name
        self.class::COLLECTION_NAME
      end

      def collection_list
        collection_paginated(
          results_list
        )
      end
    end
  end
end
