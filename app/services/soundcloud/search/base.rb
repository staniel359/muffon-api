module SoundCloud
  module Search
    class Base < SoundCloud::API::V2::Base
      def call
        check_args

        data
      rescue Faraday::UnauthorizedError
        retry_with_new_client_id
      end

      private

      def required_args
        %i[
          query
        ]
      end

      def data
        { search: search_data }
      end

      def raw_collection
        response_data['collection']
      end

      def params
        {
          **super,
          q: @args[:query],
          limit:,
          offset:
        }
      end

      def items_count
        response_data['total_results']
      end

      def maximum_items_count
        pagination_maximum_items_count_data[:search]
      end
    end
  end
end
